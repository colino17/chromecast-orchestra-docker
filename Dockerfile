FROM alpine:latest

# ENVIRONMENT
ENV TZ="Canada/Atlantic"
ENV HOME="/data/home"

# BASICS
RUN apk add --no-cache bash curl sed android-tools tzdata busybox-extras

# TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ADD APPLICATION
COPY ccorc /usr/local/bin/ccorc
RUN chmod +x /usr/local/bin/ccorc

# SETUP WEBUI
COPY www /www
RUN chmod 755 /www/cgi-bin/*
EXPOSE 9276 www /www

# CMD
CMD ["ccorc", "web"]
