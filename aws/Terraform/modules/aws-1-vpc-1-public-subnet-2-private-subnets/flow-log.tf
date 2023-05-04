resource "aws_flow_log" "VpcFlowLog" {
	log_destination =  aws_cloudwatch_log_group.VpcFlowLogGroup.arn
	iam_role_arn = aws_iam_role.VPCFlowLogAccessRole.arn
	vpc_id = aws_vpc.Vpc.id
	traffic_type = local.FlowLogTrafficType
}

resource "aws_cloudwatch_log_group" "VpcFlowLogGroup" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_VPC_FLOW_LOG_GROUP_${local.uuid}_${local.RegionTag}"
}