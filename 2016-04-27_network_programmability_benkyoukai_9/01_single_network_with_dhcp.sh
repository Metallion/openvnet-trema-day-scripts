#!/bin/bash
set -ue

. 00_base.sh

cat <<EOS
*********************************************************
* Setting up OpenVNet virtual network: Single with DHCP *
*********************************************************
EOS

vnctl networks add --uuid "nw-vnet1" --display_name "vnet1" --ipv4_network "10.101.0.0" --ipv4_prefix "24" --domain_name "vnet1" --network_mode "virtual"


vnctl interfaces add --uuid "if-v1" --port_name "if-v1" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:00:01" --ipv4_address "10.101.0.11"
vnctl interfaces add --uuid "if-v2" --port_name "if-v2" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:00:02" --ipv4_address "10.101.0.12"
vnctl interfaces add --uuid "if-v3" --port_name "if-v3" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:00:03" --ipv4_address "10.101.0.13"
vnctl interfaces add --uuid "if-v4" --port_name "if-v4" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:00:04" --ipv4_address "10.101.0.14"
vnctl interfaces add --uuid "if-v5" --port_name "if-v5" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:00:05" --ipv4_address "10.101.0.15"
vnctl interfaces add --uuid "if-v6" --port_name "if-v6" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:00:06" --ipv4_address "10.101.0.16"

vnctl interfaces add --uuid "if-dhcp1" --network_uuid "nw-vnet1" --mac_address "02:00:00:00:01:01" --ipv4_address "10.101.0.2" --mode "simulated"
vnctl network_services add --uuid "ns-dhcp1" --interface_uuid "if-dhcp1" --mode "dhcp"

cat <<EOS
**************************************************************
* DONE setting up OpenVNet virtual network: Single with DHCP *
**************************************************************
EOS
