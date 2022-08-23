title 'GCP - GKE Test Cases'

PROJECT_ID = input('gcp_Project_ID', description: 'gcp project id')
PROJECT_NUMBER = input('gcp_Project_Number', description: 'gcp project unique number')
CLUSTER_NAME = input('k8s_container_cluster_name', description: 'GCP Cluster Name')
CLUSTER_ZONE = input('k8s_container_cluster_location', description: 'GCP Cluster Zone')
VPC_NW_NAME = input('VPC_NETWORK_NAME', description: 'GCP VPC Name')


control 'gcp_tf_utc' do
  impact 1.0

  title 'Check GCP Project Info'
  describe google_project(project: PROJECT_ID) do
    it { should exist }
    its('name') { should eq PROJECT_ID }
    its('project_number') { should eq PROJECT_NUMBER }
    its('lifecycle_state') { should eq 'ACTIVE' }
  end

  # GCP GKE Cluster Units Test cases

  describe google_container_cluster(project: PROJECT_ID, location: CLUSTER_ZONE, name: CLUSTER_NAME) do
    it { should exist }
    its('name') { should eq CLUSTER_NAME }
    its('status') { should eq 'RUNNING' }
    its('location') { should match CLUSTER_ZONE }
    its('network') { should eq VPC_NW_NAME }
    its('subnetwork') { should eq 'private' }
    its('initial_node_count') { should eq 1 }
    its('node_config.disk_size_gb') { should eq 100 }
    its('node_config.image_type') { should eq "COS_CONTAINERD" }
    its('node_pools.count') { should eq 2 }
    its('private_cluster_config.enable_private_nodes') { should eq true }
  end

  google_compute_networks(project: PROJECT_ID).network_names.each do |network_name|
    describe google_compute_network(project: PROJECT_ID,  name: network_name) do
      its ('subnetworks.count') { should be < 60 }
      its ('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
      its ('routing_config.routing_mode') { should eq "REGIONAL" }
    end
  end

end
