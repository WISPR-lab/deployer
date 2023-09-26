# mlab deployer
Continuous deployment done right.

For people tired of running ad hoc deployment scripts
and lack proper permissions to setup continuous deployment for their repository.

Use [this script][setup_sh] to setup a git server on your remote machine for easy deployment.

## Objective

Easy CI/CD for mlab

## Overview

Auto deploy involves packaging code and running a service.

Service management:
- process supervision:
    - systemd, launchd, OpenRC
    - user space alternatives: supervisord
- container management:
    - Docker compose
    - Kubernetes / Docker swarm

I like to keep my remote environments clean, so I use run stuff in containers. Any container runtime/platform should work, e.g. Kubernetes, Docker, Podman, etc.
I like to keep my development environment clean, but I also don't want to source venv everytime I enter the project directory, so no, Ansible out.

Automatic deployment with git

[setup_sh]: https://github.com/nyu-mlab/deployer/blob/main/scripts/new_remote.sh
