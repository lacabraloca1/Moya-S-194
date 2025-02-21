FROM ubuntu:latest
LABEL authors="axely"

ENTRYPOINT ["top", "-b"]