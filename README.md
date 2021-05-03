# Docker Registry

Docker registries (proxy / pull cache).

## Usage

* Clone this repository
* Run `terraform init`, `terraform plan` and `terraform apply`

You may export the folowing variables before:

| Variable              | Description         | Export example                            |
|-----------------------|---------------------|-------------------------------------------|
| `docker_hub_username` | Docker Hub username | `export TF_VAR_docker_hub_username="..."` |
| `docker_hub_password` | Docker Hub password | `export TF_VAR_docker_hub_password="..."` |

## Modules

| Path           | Description          |
|----------------|----------------------|
| `modules/node` | Docker registry node |

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

The restart your Docker daemon: `sudo systemctl restart docker`
