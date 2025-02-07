# Resource: EKS Fargate Profile
resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name           = data.terraform_remote_state.eks.outputs.cluster_id
  fargate_profile_name   = "${local.name}-fp-app1"
  pod_execution_role_arn = aws_iam_role.fargate_profile_role.arn
  # fargate profiles are only created in private subnets
  subnet_ids = data.terraform_remote_state.eks.outputs.private_subnets
  # deployments,pods or any workloads deployed in the fp-ns-app1 namespace are deployed through fargate profile.
  selector {
    #namespace = "fp-ns-app1"
    namespace = kubernetes_namespace_v1.fp_ns_app1.metadata[0].name
  }
}