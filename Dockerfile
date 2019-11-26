FROM circleci/node:10

RUN sudo apt-get update && sudo apt-get install raptor2-utils

ADD ./scripts /scripts

RUN sudo chmod +x /scripts/*
