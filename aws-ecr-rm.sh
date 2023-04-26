#!/bin/bash

# set the AWS region and ECR repository list
AWS_REGION=<your-aws-region>
ECR_REPOSITORIES=$(aws ecr describe-repositories --region $AWS_REGION --query 'repositories[].repositoryName' --output text)

# loop through each ECR repository and delete it
for REPO in $ECR_REPOSITORIES; do
  # check if the repository has any images
  IMAGE_TAGS=$(aws ecr list-images --region $AWS_REGION --repository-name $REPO --query 'imageIds[].imageTag' --output text)
  if [ -n "$IMAGE_TAGS" ]; then
    # delete all images in the repository
    aws ecr batch-delete-image --region $AWS_REGION --repository-name $REPO --image-ids $(aws ecr list-images --region $AWS_REGION --repository-name $REPO --query 'imageIds[*]' --output json)
  fi
  # delete the repository itself
  aws ecr delete-repository --region $AWS_REGION --repository-name $REPO --force
done
