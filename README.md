# terraform-gcp-IaC
This repo Contains Terraform manifests to Spin up GKE Cluster and to Test the Terraform manifests using Kitchen-terraform

Kitchen- Terraform References:
Using Chef InSpec on Cloud Platforms
Google Cloud Platform support for InSpec · Christoph Hartmann (lollyrock.com)
Provisioning testing: Verify Terraform setups with InSpec · Christoph Hartmann (lollyrock.com)

To test the Unit test cases using Inspec Profile (Isolated Testing) first we have to ensure the Inspec binary has been installed in our Local machine.

To Create a Inspect Profile:
      inspec init profile --platform gcp my-profile

Ensure the Google cloud authenticated using Service account:

gcloud auth activate-service-account --key-file <ket.json>

To Run the Inspec Test:

inspec exec . --input-file inputs.yml  --insecure -t gcp://
