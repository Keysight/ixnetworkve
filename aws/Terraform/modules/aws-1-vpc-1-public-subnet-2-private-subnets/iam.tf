resource "aws_iam_role" "VPCFlowLogAccessRole" {
	name = "${local.UserLoginTag}_${local.ProjectTag}_VPC_FLOW_LOG_ACCESS_ROLE_${local.uuid}_${local.RegionTag}"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "vpc-flow-logs.amazonaws.com"
			},
			"Effect": "Allow"
		}
	]
}
EOF
	permissions_boundary = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
	path = "/"
}