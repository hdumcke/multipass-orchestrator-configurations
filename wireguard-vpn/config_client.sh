wireguard-vpn-client:
  cpu: 2
  mem: 2G
  disk: 5G
  image: jammy
  cloud_init: ./cloud-config.yaml
  git_repos:
    - https://github.com/hdumcke/multipass-orchestrator-configurations.git
  build_scripts:
    - ./multipass-orchestrator-configurations/wireguard-vpn/build_client.sh
