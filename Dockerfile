FROM ubuntu:latest AS BUILD_IMAGE
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt install wget -y && wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
RUN apt install unzip && unzip 2134_gotto_job.zip && rm 2134_gotto_job.zip


FROM ubuntu:latest
RUN apt update && apt install apache2 -y
RUN rm /var/www/html/index.html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
COPY --from=BUILD_IMAGE 2134_gotto_job /var/www/html
WORKDIR /var/www/html
