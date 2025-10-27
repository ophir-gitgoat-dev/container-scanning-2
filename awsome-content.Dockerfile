FROM node:22.18.0-bullseye

WORKDIR /usr/src/app

RUN npm i aws-sdk@2.1297.0

RUN npx aws --version

RUN npm i libxml # oh no we might have cves ;-)

COPY requirements.txt requirements.txt

COPY package.json package-lock.json ./

RUN npm install

RUN echo "Arnica is awesome!!!"

COPY . .

RUN cat /etc/os-release

CMD ["echo", "hello", "world"]
