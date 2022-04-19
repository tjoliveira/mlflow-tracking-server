FROM python:latest

LABEL org.opencontainers.image.authors="tiago.jose.martins.oliveira@gmail.com"

USER root

RUN mkdir /app

WORKDIR /app

COPY . /app/

EXPOSE 80

RUN apt-get -y update \
    && apt-get -y install nginx  \
    && apt-get -y install apache2-utils \
    && pip install --upgrade pip \
    && pip install pymysql \
    && pip install psycopg2-binary \
    && pip install boto3 \
    && pip install mlflow \
    && pip install matplotlib \
    && chmod +x /app/scripts/entrypoint.sh \
    && chmod +x /app/scripts/run_mlflow.sh \
    && chmod +x /app/scripts/run_nginx.sh \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && cp /app/configs/nginx.conf /etc/nginx/

ENTRYPOINT ./scripts/entrypoint.sh
