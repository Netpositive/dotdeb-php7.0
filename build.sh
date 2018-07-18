#!/usr/bin/env bash
set -e

if [ -z "$TAG" ]; then
    TAG=$(date "+%Y%m%d");
fi

TAG_LATEST=${TAG_LATEST:-0}
PUSH_IMAGES=${PUSH_IMAGES:-0}

echo $TAG
echo $TAG_LATEST
echo $PUSH_IMAGES
exit 1
echo "Building base image with tag: $TAG"
docker build --pull --no-cache -t netpositivehu/dotdeb-php7.0:$TAG base

#echo "Building qatools image with tag: $TAG"
#docker build --pull --no-cache -t netpositivehu/dotdeb-php7.0-qatools:$TAG qatools

#echo "Building staging image with tag: $TAG"
#docker build --pull --no-cache -t netpositivehu/dotdeb-php7.0-staging:$TAG staging


if [ "$TAG" != "latest" ] && [ $TAG_LATEST == 1 ]; then
    echo "Tagging latest too..."
    docker tag netpositivehu/dotdeb-php7.0:$TAG netpositivehu/dotdeb-php7.0:latest
    #docker tag netpositivehu/dotdeb-php7.0-qatools:$TAG netpositivehu/dotdeb-php7.0-qatools:latest
    #docker tag netpositivehu/dotdeb-php7.0-staging:$TAG netpositivehu/dotdeb-php7.0-staging:latest
fi

if [ $PUSH_IMAGES == 1 ]; then
    echo "Pushing images..."
    docker push netpositivehu/dotdeb-php7.0:$TAG
    #docker push netpositivehu/dotdeb-php7.0-qatools:$TAG
    #docker push netpositivehu/dotdeb-php7.0-staging:$TAG

    if [ "$TAG" == "latest" ] || [ $TAG_LATEST == 1 ]; then
        docker push netpositivehu/dotdeb-php7.0:latest
        #docker push netpositivehu/dotdeb-php7.0-qatools:latest
        #docker push netpositivehu/dotdeb-php7.0-staging:latest
    fi
fi
