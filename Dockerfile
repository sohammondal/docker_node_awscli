FROM node:slim
WORKDIR /home

## Installing Dependencies - Python3, Pip3
RUN apt-get update -y && \
    apt-get install software-properties-common -y && \
    python3 -V && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py

## Installing AWS cli and Boto3
RUN pip3 install awscli boto3 --upgrade && \
    aws --version


