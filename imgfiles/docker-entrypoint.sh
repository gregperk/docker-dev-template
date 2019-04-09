#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    code-server --allow-http --no-auth --data-dir /vsdata /src
  else
    exec "$@"
fi