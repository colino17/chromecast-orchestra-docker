FROM alpine:latest

# ENVIRONMENT
ENV TZ="Canada/Atlantic"
ENV HOME="/data/home"
ENV CCTL_DATA="/data"
ENV ADB_MDNS_OPENSCREEN="1"

# BASICS
RUN apk add --no-cache bash curl sed android-tools

# TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ADD APPLICATION
COPY cctl /usr/local/bin/cctl
RUN chmod +x /usr/local/bin/cctl

# CMD
CMD ["cctl", "keepalive"]
