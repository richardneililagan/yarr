# yarr

Single node media server using Docker.

---

## Usage

Before spinning up the cluster for the first time, create a file called `.env`
in the project root directory. A file `.env.sample` is provided as a template.

```sh
cp .env.sample .env
```

You may want to take the time to go through the values in the file,
and change what you have to adjust to match your host environment.

```sh
docker compose up -d
```

## Configuration

After spinning up the cluster for the first time, you will need to configure it first.

### Adguard

Most of the services in the cluster use the Adguard service for DNS,
so most of these will fail their initial run until Adguard has been configured.

1. Visit the `adguard-home` service's configuration endpoint, which is mapped to
   the host's port `:3000` by default. Follow the steps to initialize your service.
   Note that by default, the `adguard-home` service is available internally in the cluster
   at `171.18.18.10`. This is not accessible outside of the cluster.

2. Once configured, you can manage and view your Adguard dashboard via the service's
   web interface. By default this is mapped to the host's port `:3010`.

After configuring Adguard, it's recommended to restart the cluster.
This will give the other services an opportunity to initialize themselves correctly,
now that DNS is configured.

```sh
docker compose restart
```

### qBittorrent

When the service is first run, it will generate a random password for the `admin` user,
and print it out on the logs. You need to login to the qBittorrent console
(by default on port `:8080` of the cluster), and change this to something else.
Without doing this, the administrator password is changed every time the service is restarted.

These can be changed at **Tools** > **Options** > **Web UI** once logged in.

To see what the generated password is, just query the logs for the cluster:

```sh
docker compose logs qbittorrent
```
