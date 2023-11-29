# yarr

Single node media server using Docker.

---

## Usage

```sh
docker compose up -d
```

## Configuration

After spinning up the cluster for the first time, you will need to configure it first.

### Adguard

1. Visit the `adguard-home` service's configuration endpoint, which is mapped to
   the host's port `:3000` by default. Follow the steps to initialize your service.
   Note that by default, the `adguard-home` service is available internally in the cluster
   at `171.18.18.10`. This is not accessible outside of the cluster.

2. Once configured, you can manage and view your Adguard dashboard via the service's
   web interface. By default this is mapped to the host's port `:3010`.
