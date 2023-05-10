FROM node:latest
MAINTAINER Naresh
RUN echo " Try to build my application"
COPY . /var/www
WORKDIR /var/www
RUN npm install
EXPOSE 3000 80
ENTRYPOINT ["npm","start"]
