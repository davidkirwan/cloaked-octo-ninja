# Nginx container
# VERSION 0.0.1

FROM base:latest

MAINTAINER David Kirwan <davidkirwanirl@gmail.com>

RUN     apt-get update;\
        apt-get install -y software-properties-common python-software-properties;\
        add-apt-repository -y ppa:nginx/stable;\
        apt-get update;\
        apt-get install -y nginx;\
        useradd --no-create-home nginx;

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
