# Run:
#      $ docker build -t jenkins/terraform-ldap:3.1-python-2.7.16-golang-1.11.5-terraform-0.11.14-alpine.3.10.0 .
#
# HOW TO RUN THIS IMAGE
# -----------------------
# Run:
#      $ docker run --rm -it jenkins/terraform-ldap:3.1-python-2.7.16-golang-1.11.5-terraform-0.11.14-alpine.3.10.0 terraform plan 
#
# Arguments
# ----------
ARG BASE_IMAGE="ubuntu:focal"

# Pull Base Image
# ---------------
FROM ${BASE_IMAGE}

## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Labels
# ------
#LABEL version="${PYTHON_LDAP_VERSION}-python-${PYTHON_VERSION}-golang-${GOLANG_VERSION}-${BASE_IMAGE}"
LABEL authors="Oscar Martinez <omartinex@gmail.com>"
LABEL description="Dockerizing saycheese tool!" 

# Install Dependencies
# --------------------
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y httrack php unzip curl git wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/thelinuxchoice/saycheese

WORKDIR /app/saycheese

CMD ["bash", "saycheese.sh"]
