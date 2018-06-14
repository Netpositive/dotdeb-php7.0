FROM netpositivehu/dotdeb-php7.0-qatools

MAINTAINER info@netpositive.hu

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update -y
RUN apt-get install -y \
    mysql-client \
    nodejs \
    libfontconfig \
    bzip2
RUN npm install npm@6.1 -g \
    && npm install grunt-cli@1.2 -g \
    && npm install gulp-cli@2.0 -g
