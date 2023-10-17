FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
#COPY index.html /var/www/html/index.html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip carvilla.zip
RUN cp -rvf carvilla/* .
RUN rm -rf carvilla carvilla.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
