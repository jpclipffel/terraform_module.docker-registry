# Docker Registry

A Terraform module to deploy a Docker registry (uses the `vsphere` provider).

## Usage

You may export the folowing variables:

| Variable              | Description         | Export example                            |
|-----------------------|---------------------|-------------------------------------------|
| `docker_hub_username` | Docker Hub username | `export TF_VAR_docker_hub_username="..."` |
| `docker_hub_password` | Docker Hub password | `export TF_VAR_docker_hub_password="..."` |

## Docker client configuration

Assuming the project is deployed on hosts `docker-registry-gare.dt.ept.lu` and
`docker-registry-kirchberg.dt.ept.lu`, add the following configuration in your
Docker's `/etc/docker/daemon.json`:

```JSON
{
  "insecure-registries": [
    "docker-registry-gare.dt.ept.lu:5000",
    "docker-registry-kirchberg.dt.ept.lu:5000"
  ],
  "registry-mirrors": [
    "http://docker-registry-gare:5000",
    "http://docker-registry-kirchberg:5000"
  ]
}
```

Then restart your Docker daemon: `sudo systemctl restart docker`
