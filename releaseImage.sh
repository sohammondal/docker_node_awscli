#!/bin/bash

function helper {
      echo -e "\nUsage: ./releaseImage.sh [OPTIONS]"
      echo "Options:"
      echo -e "-u\t [OPTIONAL] Your DOCKER HUB username"
      echo -e "-p\t [OPTIONAL] Your DOCKER HUB password"
      echo -e "\n*** Both options -u & -p is reqd. during first run ***\n"
      echo "Example: ./releaseImage.sh -u AB10299 -p MyPassword@123"
      echo
}

function docker_push {
      echo "Retrieving last stable Docker Image"
      DOCKER_STABLE_TAG=$(cat latestImage.txt)
      if [ -n "$DOCKER_STABLE_TAG" ]; then
      DOCKER_LATEST_TAG="$(cat latestImage.txt | cut -d: -f1):latest" # Returns REPO:latest
            echo "Pushing Docker - Tag: $DOCKER_STABLE_TAG"
            if docker push "$DOCKER_STABLE_TAG"; then
                  echo -e "\nPushing Docker - Tag: $DOCKER_LATEST_TAG"
                  if docker push "$DOCKER_LATEST_TAG"; then
                        echo -e "\nDocker Push Successful"
                        exit 0
                  fi
            else
                  echo -e "\nError: Docker Push Failed"
                  exit 1
            fi
      else
            echo -e "\nError: Unable to retrieve last stable Docker Image"
            echo -e "\nError: Docker Push Failed"
            exit 1
      fi
}

while getopts u:p: option
do
case "${option}"
in
u) USERNAME=${OPTARG};;
p) PASSWORD=${OPTARG};;
esac
done


DOCKER_REPO="https://index.docker.io/v1/"

# sed -e 's/^[[:space:]]*//'     REMOVES LEADING & TRAILING WHITE SPACES
# sed 's/"//g'                   REMOVES LEADING & TRAILING DOUBLE QUOTES
# grep -oP '"\K[^"\047]+(?=["\047])' GREP STRING INSIDE DOUBLE QUOTES

CHECK_LOGIN_STATUS=$(cat ~/.docker/config.json | grep $DOCKER_REPO | sed -e 's/^[[:space:]]*//' | grep -oP '"\K[^"\047]+(?=["\047])')

if [ -z "$CHECK_LOGIN_STATUS" ]; then # if $CHECK_LOGIN_STATUS is empty then login
      if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then # checking if user has provided USERNAME & PASSWORD
            if docker login -u $USERNAME -p $PASSWORD ; then
                  docker_push
            else
                  echo -e "\nError: Docker Login Failed. Please check your username & password and try again."
            fi
      else  
            echo -e "\nError: Docker Login Failed. Please provide credentials."
            helper
            exit 1
      fi
else
      echo "User already logged into: $CHECK_LOGIN_STATUS"
      docker_push
fi