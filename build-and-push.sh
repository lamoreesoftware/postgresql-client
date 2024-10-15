#!/usr/bin/env bash

set -e

registry="docker.io/lamoreesoftware"
repository="postgresql-client"
postgresql_major_version="14"
postgresql_minor_version="12"
tag="${1:-${postgresql_major_version}.${postgresql_minor_version}}"
builder="local"

docker buildx inspect "${builder}" > /dev/null 2>&1 || \
  docker buildx create --name "${builder}" --node local --platform linux/arm64,linux/amd64

docker buildx build --builder "${builder}" --platform=linux/amd64,linux/arm64 --push \
  --build-arg "POSTGRESQL_MAJOR_VERSION=${postgresql_major_version}" --build-arg "POSTGRESQL_MINOR_VERSION=${postgresql_minor_version}" \
  --tag "${registry}/${repository}:${tag}" --file Dockerfile .
