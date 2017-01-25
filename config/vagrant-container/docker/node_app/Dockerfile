# node_app container
# VERSION    0.0.1

# Base Ubuntu Trusty 14.04 LTS image
FROM dkirwan/base:latest

# The maintainer
MAINTAINER David Kirwan <davidkirwanirl@gmail.com>

# Provisioning the image
RUN   curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - ;\
      sudo apt-get install -y nodejs ;\
      useradd -m -p "$1$b108a043$pKWeqlfFAmU9LbrGD.wnh." -s /bin/bash node ;\
      mkdir -p ~node/node_app && chown node:node ~node/node_app

EXPOSE 5000

CMD ["node", "~node/node_app/server.js;"]
