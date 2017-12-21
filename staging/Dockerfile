FROM netpositivehu/dotdeb-php7.0-qatools

MAINTAINER info@netpositive.hu

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update -y
RUN apt-get install -y \
    mysql-client \
    nodejs \
    ruby \
    bundler \
    libfontconfig
RUN npm install npm -g \
    && npm install bower -g \
    && npm install grunt-cli -g
