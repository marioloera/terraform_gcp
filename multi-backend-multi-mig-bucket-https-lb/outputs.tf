/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "group1_region" {
  value = var.group1_region
}

output "group2_region" {
  value = var.group2_region
}

output "group3_region" {
  value = var.group3_region
}

output "load-balancer-ip" {
  value = module.gce-lb-https.external_ip
}

output "load-balancer-ipv6" {
  value       = module.gce-lb-https.ipv6_enabled ? module.gce-lb-https.external_ipv6_address : "undefined"
  description = "The IPv6 address of the load-balancer, if enabled; else \"undefined\""
}

output "asset-url" {
  value = "https://${module.gce-lb-https.external_ip}/assets/gcp-logo.svg"
}

output "asset-url-ipv6" {
  value       = module.gce-lb-https.ipv6_enabled ? "https://${module.gce-lb-https.external_ipv6_address}/assets/gcp-logo.svg" : "undefined"
  description = "The asset url over IPv6 address of the load-balancer, if enabled; else \"undefined\""
}
