resource "google_container_cluster" "__gke_name__" {
    default_max_pods_per_node   = 110
    enable_binary_authorization = false
    enable_kubernetes_alpha     = false
    enable_legacy_abac          = false
    enable_shielded_nodes       = true
    location                    = "__gke_location__"
    name                        = "__gke_name__"
    network                     = "projects/qual-shrdvpc-proj/global/networks/gcp-gni-east-qual-shrdvpc1"
    node_locations              = []
    project                     = "__gke_project__"
    resource_labels             = {}
    subnetwork                  = "projects/qual-shrdvpc-proj/regions/us-east4/subnetworks/inov-qual-smc-gke-node"

    addons_config {

        horizontal_pod_autoscaling {
            disabled = false
        }

        http_load_balancing {
            disabled = false
        }

        network_policy_config {
            disabled = true
        }
    }

    cluster_autoscaling {
        enabled = false
    }


    ip_allocation_policy {
        cluster_secondary_range_name  = "pods-cidr"
        services_secondary_range_name = "services-cidr"
    }


    master_authorized_networks_config {
        cidr_blocks {
            cidr_block = "__gke_cidr_block__"
        }
    }

    network_policy {
        enabled  = false
    }

    node_pool {
        initial_node_count  = "__gke_initial_node_count__"
        max_pods_per_node   = 110
        name                = "default-pool"
        node_locations      = [
            "__gke_zone_or_region__",
        ]

        autoscaling {
            max_node_count = 75
            min_node_count = 3
        }

        management {
            auto_repair  = true
            auto_upgrade = true
        }

        node_config {
            disk_size_gb      = 100
            disk_type         = "pd-standard"
            guest_accelerator = []
            image_type        = "ubuntu_containerd"
            labels            = {}
            local_ssd_count   = 0
            machine_type      = "n2-highmem-8"
            metadata          = {
                "disable-legacy-endpoints" = "true"
            }
            preemptible       = false
            service_account   = "__gke_service_account__"
            tags              = []
            taint             = []

            shielded_instance_config {
                enable_integrity_monitoring = true
                enable_secure_boot          = false
            }

            workload_metadata_config {
                node_metadata = "GKE_METADATA_SERVER"
            }
        }

        upgrade_settings {
            max_surge       = 3
            max_unavailable = 0
        }
    }

    private_cluster_config {
        enable_private_endpoint = true
        enable_private_nodes    = true
        master_ipv4_cidr_block  = "__gke_master_ipv4_cidr_block__"
    }

    release_channel {
        channel = "REGULAR"
    }


    vertical_pod_autoscaling {
        enabled = true
    }

    workload_identity_config {
        identity_namespace = "__gke_identity_namespace__"
    }
}
