FROM circleci/node:10

RUN sudo apt-get update && sudo apt-get install raptor2-utils

ADD ./scripts /scripts

RUN sudo chmod +x /scripts/*

RUN mkdir ~/.npm-global && \
    npm config set prefix '~/.npm-global'  && \
    export PATH=~/.npm-global/bin:$PATH  && \ 
    echo $PATH  && \
    npm install -g https://github.com/bertvannuffelen/jsonld-cli && \
    npm install -g https://github.com/semanticarts/shacl-validator

# note: the PATH update must be done before using jsonld tool usage
