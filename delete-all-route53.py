import boto3

# Create a Route 53 client
route53_client = boto3.client('route53')

# Retrieve all hosted zones
hosted_zones = route53_client.list_hosted_zones()['HostedZones']

# Delete records in each hosted zone
for zone in hosted_zones:
    hosted_zone_id = zone['Id']
    response = route53_client.list_resource_record_sets(HostedZoneId=hosted_zone_id)

    # Create a change batch for deleting the non-required records
    changes = []
    for record_set in response['ResourceRecordSets']:
        if record_set['Type'] not in ['NS', 'SOA']:
            change = {
                'Action': 'DELETE',
                'ResourceRecordSet': record_set
            }
            changes.append(change)

    # Delete the non-required records if any
    if changes:
        change_batch = {'Changes': changes}
        route53_client.change_resource_record_sets(
            HostedZoneId=hosted_zone_id,
            ChangeBatch=change_batch
        )
        print(f"Deleted records in hosted zone: {hosted_zone_id}")

    # Delete the hosted zone if it is empty
    try:
        route53_client.delete_hosted_zone(Id=hosted_zone_id)
        print(f"Deleted hosted zone: {hosted_zone_id}")
    except route53_client.exceptions.HostedZoneNotEmpty:
        print(f"Hosted zone not deleted: {hosted_zone_id} (contains non-required resource record sets)")
