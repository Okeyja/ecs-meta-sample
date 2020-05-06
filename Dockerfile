FROM openjdk:11-jre-slim
# 更新阿里云的buster版本包源
RUN echo "deb http://mirrors.aliyun.com/debian buster main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian buster main contrib non-free" >> /etc/apt/sources.list  && \
    echo "deb http://mirrors.aliyun.com/debian buster-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian buster-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list
RUN apt update && apt install -y jq && apt install -y curl
ADD target/ecs-meta-sample-0.0.1-SNAPSHOT.jar /home/runtime/run.jar
ADD script/startup.sh /home/runtime/startup.sh
CMD sh /home/runtime/startup.sh
EXPOSE 8080
