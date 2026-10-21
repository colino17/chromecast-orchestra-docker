FROM alpine:latest

# ENVIRONMENT
ENV TZ="Canada/Atlantic"
ENV HOME="/data/home"

# BASICS
RUN apk add --no-cache bash curl sed android-tools tzdata

# TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ADD APPLICATION
COPY ccorc /usr/local/bin/ccorc
RUN chmod +x /usr/local/bin/ccorc

# CMD
CMD ["ccorc", "monitor"]
