FROM python:3.10-slim-bullseye

RUN mkdir -p /octoprint/octoprint
WORKDIR /octoprint
RUN apt update
RUN apt upgrade -y
RUN apt install -y build-essential libsasl2-dev python-dev libldap2-dev libssl-dev
RUN pip install octoprint
RUN adduser octoprint
RUN usermod -a -G dialout,adm octoprint
RUN pip install https://github.com/gillg/OctoPrint-LDAP/archive/refs/heads/master.zip
RUN chown -Rvf octoprint: /octoprint

EXPOSE 5000

USER octoprint

ENTRYPOINT ["octoprint","serve","--iknowwhatimdoing","--host", "0.0.0.0","--port","5000","--basedir","/octoprint/octoprint"]

