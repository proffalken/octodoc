FROM python:3.10-slim-bullseye

RUN mkdir /app
WORKDIR /app
RUN apt update
RUN apt upgrade -y
RUN apt install -y build-essential libsasl2-dev python-dev libldap2-dev libssl-dev
RUN pip install octoprint
RUN adduser octoprint
RUN usermod -a -G dialout,adm octoprint
RUN pip install https://github.com/gillg/OctoPrint-LDAP/archive/refs/heads/master.zip

EXPOSE 5000

USER octoprint

ENTRYPOINT ["octoprint","serve"]

