#!/usr/bin/env bash
find /entrypoint -maxdepth 1 -type f -exec {} \; | tee -a /var/log/entrypoint.log