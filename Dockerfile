FROM node:8

RUN apt-get -y update \
    && apt-get -y install wget tar build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev python-pip python-dev

#INSTALL PYTHON
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz \
    && tar -xvf Python-2.7.13.tar.xz

WORKDIR /tmp/Python-2.7.13/
RUN ./configure \
    && make \
    && pip install --user XlsxWriter requests openpyxl Flask numpy flask-cors simplejson

RUN npm install -g yarn
RUN yarn global add pm2 gulp bower nodemon

WORKDIR /