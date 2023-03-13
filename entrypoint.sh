#!/usr/bin/env bash
chmod +x /entrypoint/*.sh
find /entrypoint/*.sh -maxdepth 1 -type f -exec {} \; | tee -a /var/log/cosmovisor/entrypoint.log