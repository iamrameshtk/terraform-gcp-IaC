import json 

"""
BEFORE RUNNING:
---------------
1. If not already done, enable the Compute Engine API
   and check the quota for your project at
   https://console.developers.google.com/apis/api/compute
2. This sample uses Application Default Credentials for authentication.
   If not already done, install the gcloud CLI from
   https://cloud.google.com/sdk and run
   `gcloud beta auth application-default login`.
   For more information, see
   https://developers.google.com/identity/protocols/application-default-credentials
3. Install the Python client library for Google APIs by running
   `pip install --upgrade google-api-python-client`
"""
from pprint import pprint

from googleapiclient import discovery
from oauth2client.client import GoogleCredentials

credentials = GoogleCredentials.get_application_default()

service = discovery.build('compute', 'v1', credentials=credentials)

# Project ID for this request.
project = 'rk-devops-infra'  # TODO: Update placeholder value.

firewall_body = {
  "name": "allow-master-node-egress",
  "description": "allow-master-node-egress",
  "destinationRanges": [
    "172.16.0.0/28"
  ],
  "allowed": [
    {
      "ports": [
        "443",
        "10250"
      ],
      "IPProtocol": "tcp"
    }
  ],
  "direction": "EGRESS"
}

request = service.firewalls().insert(project=project, body=firewall_body)
response = request.execute()

# TODO: Change code below to process the `response` dict:

output = {

  "firewall_name": "allow-master-node-egress",
  "ports":  "443, 10250",
  "direction": "EGRESS",
  "destinationRanges": "172.16.0.0/28"
}

output_json = json.dumps(output, indent=2)
print(output_json)