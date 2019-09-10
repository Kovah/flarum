<p align="center"><img src="https://flarum.org/img/logo.png"></p>

<p align="center">
<a href="https://travis-ci.org/flarum/core"><img src="https://travis-ci.org/flarum/core.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/flarum/core"><img src="https://poser.pugx.org/flarum/core/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/flarum/core"><img src="https://poser.pugx.org/flarum/core/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/flarum/core"><img src="https://poser.pugx.org/flarum/core/license.svg" alt="License"></a>
</p>

## About Flarum

**[Flarum](https://flarum.org/) is a delightfully simple discussion platform for your website.** It's fast and easy to use, with all the features you need to run a successful community. It is designed to be:

* **Fast and simple.** No clutter, no bloat, no complex dependencies. Flarum is built with PHP so it’s quick and easy to deploy. The interface is powered by Mithril, a performant JavaScript framework with a tiny footprint.

* **Beautiful and responsive.** This is forum software for humans. Flarum is carefully designed to be consistent and intuitive across platforms, out-of-the-box.

* **Powerful and extensible.** Customize, extend, and integrate Flarum to suit your community. Flarum’s architecture is amazingly flexible, with a powerful Extension API.

![screenshot](https://flarum.org/img/screenshot.png)

## Installation

You must have SSH access to a server with **PHP 7.1+** and **MySQL 5.6+**, and install [Composer](https://getcomposer.org/).

```
composer create-project flarum/flarum . --stability=beta
```

Read the **[Installation guide](https://flarum.org/docs/install.html)** for more information. For support, refer to the [documentation](https://flarum.org/docs/), and ask questions on the [community forum](https://discuss.flarum.org/) or [Discord chat](https://flarum.org/discord/).

## Installation with Docker

Your must have access to a Server running [Docker](https://docs.docker.com/install/) and ideally [docker-compose](https://docs.docker.com/compose/).

First, make a copy of the `.env.example` file and name it `.env`. Then change the database password inside to a strong password.

Now start the Docker stack by running `docker-compose up -d` in your shell. This will start both the Flarum container as well as a MariaDB server that uses the credentials from the .env file to setup an initial database.

Last but not least: open up your domain in the browser and you should see the Flarum setup. Change `localhost` to `db` for the database host and use the credentials from the .env file for the database name, username and password.

### Persisting user avatars

By default Docker stores all uploaded files and the configuration inside the container. Deleting the container will result in permanent data loss. To prevent this, uncomment the `volumes` section of the flarum service in the `docker-compose.yml` file. Then restart your Docker stack after you completed the Flarum setup.

### Setup a reverse proxy to your Docker container

By default the Docker image does not support SSL on its own. To connect to your Flarum installation using SSL, setup a reverse proxy in front of it and change the port of the flarum service in the `docker-compose.yml` file to something else than 80.  
You can find an example configuration for nginx in the `docker/proxy.conf` file.

## Contributing

Thank you for considering contributing to Flarum! Please read the **[Contributing guide](https://flarum.org/docs/contributing.html)** to learn how you can help.

This repository only holds the Flarum skeleton application. Most development happens in [flarum/core](https://github.com/flarum/core).

## Security Vulnerabilities

If you discover a security vulnerability within Flarum, please send an e-mail to [security@flarum.org](mailto:security@flarum.org). All security vulnerabilities will be promptly addressed.

## License

Flarum is open-source software licensed under the [MIT License](https://github.com/flarum/flarum/blob/master/LICENSE).

