#!/bin/bash

# Get a list of all S3 buckets
buckets=$(aws s3api list-buckets --query "Buckets[].Name" --output text)

# Loop through each bucket
for bucket in $buckets; do
    echo "Deleting objects in bucket: $bucket"

    # Delete all objects within the bucket
    aws s3 rm s3://$bucket --recursive

    # Delete the bucket
    echo "Deleting bucket: $bucket"
    aws s3 rb s3://$bucket --force
done

echo "All S3 buckets and objects have been deleted."
