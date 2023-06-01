FROM node:latest
RUN echo " Try to build my application"
COPY . /var/www
WORKDIR /var/www
RUN npm install
EXPOSE 31695
ENTRYPOINT ["npm","start"]
