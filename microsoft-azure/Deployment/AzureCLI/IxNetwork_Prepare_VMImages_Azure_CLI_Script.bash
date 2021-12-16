#!/bin/bash

if [ -z $1 ]; then
    echo "Error: specify the destination resource group name"
    echo "Ixia_Azure.bash <destination-resource-group-name> <destination-storage-account-name>"
    echo "<destination-resource-group-name> must be preexistent and will store the virtual machine images. Rule is to be alphanumeric, underscore, parentheses, hyphen, period (except at end)"
    echo "<destination-storage-account-name> length 3 to 24 chars, numbers and lower-case letters only."
    echo "ex: ./Ixia_Azure.bash Ixia_Images_RG ixiavhds9x10"
    exit 1
fi

if [ -z $2 ]; then
    echo "Error: specify the destination storage account name"
    echo "Ixia_Azure.bash <destination-resource-group-name> <destination-storage-account-name>"
    echo "<destination-resource-group-name> must be preexistent and will store the virtual machine images"
    echo "<destination-storage-account-name> length 3 to 24 alphanumeric lowercase only and unique across azure universe. Needed for storing the vhd files."
    echo "./Ixia_Azure.bash Ixia_Images_RG ixiavhds9x10"
    exit 1
fi

if ! [ -x "$(command -v az)" ]; then
  echo 'Error: az is not installed.' >&2
  exit 1
fi

if [[ $(az account show 2>&1) =~ "Please run 'az login' to setup account" ]]
then
   echo "Error: you are not logged in to Azure. Please login and retry!"
   exit 1
fi

#source
source_ixload_ve_client_blob=IxLoad_VE_Client_9.10.vhd
source_virtual_test_appliance_blob=Ixia_Virtual_Test_Appliance_9.10.vhd
source_ixloadve_account_name=ixloadve910
source_ixload_ve_client_container=ixloadveclient910
source_virtual_test_appliance_container=vta910
source_ixloadve_account_key=dJXRv4ijLZvtrAlDZEHt1nE2TX+NO+SkOtPf07R39dROOFyrrhbNB3uKCZcskT6YJZRiUC8mmuFgp4oVYrLHfA==

#destination
destination_resource_group_name=$1
destination_account_name=$2
destination_container_name=ixloadve910
destination_ixload_ve_client_blob=IxLoad_VE_Client_9.10.vhd
destination_virtual_test_appliance_blob=Ixia_Virtual_Test_Appliance_9.10.vhd
destination_ixload_ve_client_vmImage=$(basename $destination_ixload_ve_client_blob .vhd)
destination_virtual_test_appliance_vmImage=$(basename $destination_virtual_test_appliance_blob .vhd)

echo "Checking that the destination resource group already exists"
check_resource_group=$(az group exists -n $destination_resource_group_name)
if [ "$check_resource_group" == "false" ]; then echo "$destination_resource_group_name does not exist. Please use an already created resource group"; exit 2; fi
echo "Creating a new storage account"
create_new_dest_acc=$(az storage account show -g $destination_resource_group_name -n $destination_account_name --query name)

if [ "$create_new_dest_acc" == "" ];then
    echo "Creating: $destination_account_name under resource group: $destination_resource_group_name"
    is_new_dest_acc_ok=$(az storage account check-name --name $destination_account_name --query nameAvailable)
    if [ "$is_new_dest_acc_ok" == "true" ];then
        az storage account create -n $destination_account_name -g $destination_resource_group_name
    else
        echo "Unable to create storage account $destination_account_name under resource group $destination_resource_group_name"
        echo "The name already exists somewhere or is not formated correctly <length 3 to 24 chars, numbers and lower-case letters only>"
        exit 1
    fi
fi

echo "Creating a new destination storage account"
check_new_dest_acc=$(az storage account show -g $destination_resource_group_name -n $destination_account_name --query name)
if [ "$check_new_dest_acc" == "" ];then
    echo "Unable to create storage account $destination_account_name under resource group $destination_resource_group_name. try creating it manually and restart the script"
    exit 1
fi

account_key=`az storage account keys list --account-name $destination_account_name --query [0].value`

echo "Creating storage blob container"
dest_container_exists=$(az storage container exists --account-name $destination_account_name --name $destination_container_name --query exists)
if [ "$dest_container_exists" == "false" ];then
    echo "Creating: $destination_container_name container under storage account: $destination_account_name"
    az storage container create --name $destination_container_name --account-key $account_key --account-name $destination_account_name
fi
echo "Verifying that the container was created"
dest_container_exists=$(az storage container exists --account-name $destination_account_name --name $destination_container_name --query exists)
if [ "$dest_container_exists" == "false" ];then
    echo "FAILED: Creating: $destination_container_name container under storage account: $destination_account_name"
    echo "Try creating it manually and restart the script"
    exit 2
fi


echo "Copying IxLoad VE Client blob to destination container"
az storage blob copy start \
    --account-name $destination_account_name \
    --account-key $account_key \
    --destination-container $destination_container_name \
    --destination-blob $destination_ixload_ve_client_blob \
    --source-account-name $source_ixloadve_account_name \
    --source-account-key $source_ixloadve_account_key \
    --source-container $source_ixload_ve_client_container \
    --source-blob $source_ixload_ve_client_blob

    
echo "Copying Virtual Test Appliance blob to destination container"
az storage blob copy start \
    --account-name $destination_account_name \
    --account-key $account_key \
    --destination-container $destination_container_name \
    --destination-blob $destination_virtual_test_appliance_blob \
    --source-account-name $source_ixloadve_account_name \
    --source-account-key $source_ixloadve_account_key \
    --source-container $source_virtual_test_appliance_container \
    --source-blob $source_virtual_test_appliance_blob


echo "Waiting for Ixia IxLoad VE Client image copy to finish"
copy_status=`az storage blob show --account-key $account_key --account-name $destination_account_name --container-name $destination_container_name --name $destination_ixload_ve_client_blob --query properties.copy.status`
while [ $copy_status != "\"success\"" ]; do
    sleep 1;
    copy_status=`az storage blob show --account-key $account_key --account-name $destination_account_name --container-name $destination_container_name --name $destination_ixload_ve_client_blob --query properties.copy.status`
    echo $copy_status
done

echo "Waiting for Ixia Virtual Test Appliance image copy to finish"
copy_status=`az storage blob show --account-key $account_key --account-name $destination_account_name --container-name $destination_container_name --name $destination_virtual_test_appliance_blob --query properties.copy.status`
while [ $copy_status != "\"success\"" ]; do
    sleep 1;
    copy_status=`az storage blob show --account-key $account_key --account-name $destination_account_name --container-name $destination_container_name --name $destination_virtual_test_appliance_blob --query properties.copy.status`
    echo $copy_status
done

echo "Creating  Ixia Virtual Test Appliance image"
az image create -g $destination_resource_group_name -n $destination_virtual_test_appliance_vmImage --os-type Linux --source https://$destination_account_name.blob.core.windows.net/$destination_container_name/$destination_virtual_test_appliance_blob
echo "End of script"
