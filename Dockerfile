FROM ubuntu:18.04
WORKDIR /app

#RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
#RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install  vim cmake build-essential wget git

RUN git clone https://github.com/flow2000/lookbusy.git
RUN cd lookbusy && chmod +x ./configure && ./configure && make
# COPY start.sh /root/
CMD ["sh", "/app/start.sh"]