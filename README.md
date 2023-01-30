<p align="center">
<a href="https://flarum.org/"><img src="https://flarum.org/assets/img/logo.png"></a>
</p>

<p align="center">
<a href="https://packagist.org/packages/flarum/core"><img src="https://poser.pugx.org/flarum/core/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/flarum/core"><img src="https://poser.pugx.org/flarum/core/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/flarum/core"><img src="https://poser.pugx.org/flarum/core/license.svg" alt="License"></a>
</p>

## About Flarum

**[Flarum](https://flarum.org/) is a delightfully simple discussion platform for your website.** It's fast and easy to use, with all the features you need to run a successful community. It is designed to be:

* **Fast and simple.** No clutter, no bloat, no complex dependencies. Flarum is built with PHP so it’s quick and easy to deploy. The interface is powered by Mithril, a performant JavaScript framework with a tiny footprint.

* **Beautiful and responsive.** This is forum software for humans. Flarum is carefully designed to be consistent and intuitive across platforms, out-of-the-box.

* **Powerful and extensible.** Customize, extend, and integrate Flarum to suit your community. Flarum’s architecture is amazingly flexible, with a powerful Extension API.

![screenshot](https://flarum.org/assets/img/home-screenshot.png)

## Installation

Read the **[Installation guide](https://docs.flarum.org/install)** to get started. For support, refer to the [documentation](https://docs.flarum.org/), and ask questions on the [community forum](https://discuss.flarum.org/) or [Discord chat](https://flarum.org/discord/).

## Installation with Docker

Your must have access to a Server running [Docker](https://docs.docker.com/install/) and ideally [docker-compose](https://docs.docker.com/compose/).

First, make a copy of the `.env.example` file and name it `.env`. Then change the database password inside to a strong password.

Now start the Docker stack by running `docker-compose up -d` in your shell. This will start both the Flarum container as well as a MariaDB server that uses the credentials from the .env file to setup an initial database.

Last but not least: open up your domain in the browser and you should see the Flarum setup. Change `localhost` to `db` for the database host and use the credentials from the .env file for the database name, username and password.

### Persisting assets and backing up the configuration

First of all, if Flarum is running, backup your `config.php` file which is necessary to run Flarum. You can run the following command, where flarum_1 is the name of your specific Flarum container

```
docker exec flarum_1 bash -c "cat config.php" > config.php
```

To restore the config.php file in case it got lost while upgrading or cleaning up, run the following command while the container is running. Again, flarum_1 needs to be replaced with the name of your container.

```
docker cp config.php flarum_1:/srv/config.php
```

By default Docker stores all uploaded files and the configuration inside the container. Deleting the container will result in permanent data loss. To prevent this, uncomment the `volumes` section of the flarum service in the `docker-compose.yml` file. Then restart your Docker stack after you completed the Flarum setup.  
Make sure that the `./data/assets` directory is writable, otherwise your won't be able to save any new avatars.

### Setup a reverse proxy to your Docker container

By default the Docker image does not support SSL on its own. To connect to your Flarum installation using SSL, setup a reverse proxy in front of it and change the port of the flarum service in the `docker-compose.yml` file to something else than 80.  
You can find an example configuration for nginx in the `docker/proxy.conf` file.

## Contributing

Thank you for considering contributing to Flarum! Please read the **[Contributing guide](https://docs.flarum.org/contributing)** to learn how you can help.

This repository only holds the Flarum skeleton application. Most development happens in [flarum/core](https://github.com/flarum/core).

## Security Vulnerabilities

If you discover a security vulnerability within Flarum, please follow our [security policy](https://github.com/flarum/core/security/policy) so we can address it promptly.

## License

Flarum is open-source software licensed under the [MIT License](https://github.com/flarum/flarum/blob/master/LICENSE).

