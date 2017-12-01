#!/usr/bin/env sh
set -e

TAG=${1:-"latest"}

echo "Building base image with tag: $TAG"
docker build -t netpositivehu/dotdeb-php7.0:$TAG base

echo "Building qatools image with tag: $TAG"
docker build -t netpositivehu/dotdeb-php7.0-qatools:$TAG qatools

echo "Building staging image with tag: $TAG"
docker build -t netpositivehu/dotdeb-php7.0-staging:$TAG staging
