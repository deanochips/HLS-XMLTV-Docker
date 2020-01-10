FROM alpine:3.10

LABEL maintainer="HLS / XMLTV - Home-Broadcasting - By Dean Butler"

EXPOSE 3000 80

# procps needed for (ps -p) to detect if process is running
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories ; \
 apk add --no-cache fdk-aac-dev \
 tini \
 procps \
 ffmpeg \
 bash \ 
 bash-completion \
 coreutils \
 ncurses \
 logrotate \
 python3 \
 jq \
 htop \
 nano \
 findutils \
 nginx
 
# merged COPY into one call to reduce docker layers
COPY /copy/init.sh /copy/.bashrc /copy/default /copy/nginx.conf /copy/rotate_hls_xmltv_logs /tmp/


# setup crons
# add www-data
# move and setup config files 
RUN mv /tmp/init.sh /init.sh ; \
  rm /etc/nginx/nginx.conf ; \
  mv /tmp/nginx.conf /etc/nginx/nginx.conf ; \
  mv rotate_hls_xmltv_logs /etc/logrotate.d/rotate_hls_xmltv_logs ; \
  rm /etc/nginx/conf.d/default.conf ; \
  mv /tmp/default /etc/nginx/conf.d/default.conf ; \
  mv /tmp/.bashrc /root/.bashrc ; \
  cd / ; \
  chmod +x init.sh ; \
  set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1


# Needed to launch both NGINX and CROND at same time
CMD [ "/bin/bash", "-c", "nginx && crond -f"]

# Needed to stop ffmpeg processes being reaped as zombies bash script has finished running and launch startup processes
ENTRYPOINT ["/sbin/tini", "--", "/init.sh"]
