# gcp-v1.7.0

fixes:
* `gcp/firestore/firestore/main`: del garbage from code

# gcp-v1.7.0

features:
* `gcp/firestore/firestore_index`: added firestore index module to firestore in gcp

# gcp-v1.6.1

fixes:
* `monitoring/dashboards`: changed  goupByFields field default from [] to null
* `datastore indecies`: changed indexies job timeouts default from 50 minutes to 90 minutes for create/delete operations

# gcp-v1.6.0

features:
  * `gke`:
    * `enabled` flag
    * `deletion_protection` attribute

# gcp-v1.5.2

fixes:
* `monitoring/dashboards`: added if statements to delete unnecessary fields in dashboards
* `datastore indecies`: added indexies job timeouts (default 50 minutes for create/delete operations) 

# gcp-v1.5.1

fixes:
* `monitoring/dashboards`: use `templatefile` because `registry.terraform.io/hashicorp/template` provider in depricated and dosent support darwin_arm64 packages
* `cloudsql`: pin version of cloudsql module to v22.1.0

# gcp-v1.5.0

features:
* `gcs`: added new role 'storage.objectUser'
fixes:
* `gcs`: fixed creation of empty google_storage_bucket_iam_building resources. (when executing terraform apply, you will be prompted to delete empty resources)

# gcp-v1.4.1

features:
* `gcs`: ability to set `retention_duration_seconds` for `soft_delete_policy` using variable `soft_delete_duration`
fixes:
* `monitoring`: fix `var.monitoring is object with no attributes`


# gcp-v1.4.0

Added `monitoring` module:
 - ability to creating `log based metrics`
 - ability to creating `dashboards`

# gcp-v1.3.2

fixes:
* `pubsub`: var.subscriptions is null. (The given "for_each" argument value is unsuitable: the given "for_each" argument value is null. A map, or set of strings is allowed.)


# gcp-v1.3.1

Enhancements:
* `vm`: ability to specify `auto_delete` property of attached additional disks

# gcp-v1.3.0

features:
* `vm`: ability to attach additional disks

# gcp-v1.2.1

fixes:
* `vm`: create public ip in same region as vm

# gcp-v1.2.0

features:
* `vm`: iam roles

# gcp-v1.1.4

Enhancements:
* `gcp`: use `any` as inputs to gcp module to avoid `all map elements must have the same type.` errors
* `network`: use `any` as input for firewall rules module to avoid `all map elements must have the same type.` errors
* `vm`: default `[]` for `service_account.roles` input

# gcp-v1.1.3

Enhancements:
* `firestore`: Added the ability to use backups in firestore

# gcp-v1.1.2

Enhancements:
* `cloud_tasks`: add logging

# gcp-v1.1.1

features:
* `network`: nat gws new attributes (max/min port per vm + `enable_dynamic_port_allocation`)

# gcp-v1.1.0

features:
* `network`: create nat gws only for specific subnetworks

# gcp-v1.0.8

Enhancements:
* `cloudrun`: the ability to set labels

# gcp-v1.0.7

Enhancements:
* `network/firewall-rules`: additional `source_service_accounts`, `source_tags` attrs

# gcp-v1.0.6

Fixes:
* `pubsub`: fix the `max_delivery_attempt` value was reset with each terraform apply

# gcp-v1.0.5

* `cloudrun`: add `max_instance_requests` attribute to control max cloudrun concurrent requests
