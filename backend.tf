terraform {
  backend "gcs" {
    bucket  = "gke-cluster-state-inovalon"
    prefix  = "__gke_prefix__"
    #credentials = "/root/sangram/key.json"
  }
}
