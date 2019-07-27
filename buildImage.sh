#!/bin/bash

while getopts v: option
do
case "${option}"
in
v) VERSION=${OPTARG};;
esac
done


if [ -z "$VERSION" ]; then
  echo -e "\nError: Need to pass the image version"
  echo -e "\nUsage: ./buildImage.sh -v [VERSION]"
  echo "Example: ./buildImage.sh -v 1.1.2"
  echo
  exit 1
fi

REPO="sohammondal/node-awscli"
DOCKER_TAG="$REPO:$VERSION"
DOCKER_LATEST_TAG="$REPO:latest"

echo "Building Docker Image - Tag: $DOCKER_TAG"
if IMAGE_ID=$(docker build -q -t "$DOCKER_TAG" -t "$DOCKER_LATEST_TAG" .); then
      echo "Successfully Built Docker Image - Id: $IMAGE_ID"
      echo $DOCKER_TAG > latestImage.txt
      exit 0 
else
      echo "Error: Build Failed"
      echo "Removing dangling images"
      docker system prune -f
      exit 1
fi