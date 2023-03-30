pg_dump -U username -h hostname -d dbname > backup.sql
aws s3 cp backup.sql s3://my-bucket/
aws s3 cp s3://my-bucket/backup.sql backup.sql
gcloud sql instances create my-instance --tier=db-f1-micro --region=us-central1 --project=my-project
gcloud sql import sql my-instance gs://my-bucket/backup.sql --database=my-database --user=my-user --password=my-password
psql -h <INSTANCE_IP> -U <USERNAME> -d <DATABASE_NAME>




#!/bin/bash

# Backup the PostgreSQL database
pg_dump -U username -h hostname -d dbname > backup.sql

# Upload the backup to S3
aws s3 cp backup.sql s3://my-bucket/

# Download the backup from S3
aws s3 cp s3://my-bucket/backup.sql backup.sql

# Create a Google Cloud SQL instance
gcloud sql instances create my-instance --tier=db-f1-micro --region=us-central1 --project=my-project

# Import the backup to Google Cloud SQL
gcloud sql import sql my-instance gs://my-bucket/backup.sql --database=my-database --user=my-user --password=my-password

# Verify the migration
psql -h <INSTANCE_IP> -U <USERNAME> -d <DATABASE_NAME> -c "SELECT count(*) FROM my_table;"





#!/bin/bash

# Set variables for the AWS source database
SOURCE_HOST=my-source-database.xxxxxxx.us-east-1.rds.amazonaws.com
SOURCE_PORT=5432
SOURCE_DB=my-source-db
SOURCE_USER=my-source-user
SOURCE_PASS=my-source-pass

# Set variables for the GCP destination database
DEST_INSTANCE=my-dest-instance
DEST_DB=my-dest-db
DEST_USER=my-dest-user
DEST_PASS=my-dest-pass

# Create a Cloud SQL for PostgreSQL instance if it doesn't already exist
gcloud sql instances create $DEST_INSTANCE --tier=db-n1-standard-1 --region=us-central1

# Create a database in the Cloud SQL instance
gcloud sql databases create $DEST_DB --instance=$DEST_INSTANCE

# Create a user for the Cloud SQL instance
gcloud sql users create $DEST_USER --instance=$DEST_INSTANCE --password=$DEST_PASS

# Grant the user privileges to the database
gcloud sql users set-password $DEST_USER --instance=$DEST_INSTANCE --password=$DEST_PASS
gcloud sql users add-iam-policy-binding $DEST_USER --instance=$DEST_INSTANCE --member=user:$DEST_USER --role=cloudsql.editor
gcloud sql databases create $DEST_DB --instance=$DEST_INSTANCE

# Use pg_dump to create a backup file of the AWS database
pg_dump --host=$SOURCE_HOST --port=$SOURCE_PORT --dbname=$SOURCE_DB --username=$SOURCE_USER --password=$SOURCE_PASS --format=custom --file=backup.dump

# Copy the backup file to a Cloud Storage bucket
gsutil cp backup.dump gs://my-bucket/

# Import the backup file into the Cloud SQL instance
gcloud sql import sql $DEST_INSTANCE gs://my-bucket/backup.dump --database=$DEST_DB --user=$DEST_USER

# Verify the migration
gcloud sql connect $DEST_INSTANCE --user=$DEST_USER --password=$DEST_PASS $DEST_DB --execute "SELECT count(*) FROM my_table;"










