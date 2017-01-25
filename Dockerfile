FROM ubuntu:16.04 
MAINTAINER Supriya kanawade <supriyakanawade94@gmail.com> 

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "build-dep", "libcurl4-gnutls-dev"]
RUN ["apt-get", "install", "python3", "python3-pip", "r-base", "libcurl4-gnutls-dev", "-y"]
RUN ["pip3", "install", "--upgrade", "pip"]
RUN ["pip3", "install", "jupyter"]
COPY Rprofile.site /etc/R/Rprofile.site
RUN ["R", "-q", "-e", "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))"]
RUN ["R", "-q", "-e", "install.packages('devtools')"]
RUN ["R", "-q", "-e", "devtools::install_github('IRkernel/IRkernel')"]
RUN ["R", "-q", "-e", "IRkernel::installspec()"]
CMD ["/usr/local/bin/jupyter", "notebook", "--ip=*", "--no-browser"]
