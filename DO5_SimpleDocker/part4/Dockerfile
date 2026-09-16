FROM nginx:latest

COPY server/server.c /server.c
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && \
    apt-get install -y gcc libfcgi-dev spawn-fcgi && \
    gcc /server.c -o /server.fcgi -lfcgi && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 81 8080

CMD ["sh", "-c", "spawn-fcgi -p 8080 /server.fcgi && nginx -g 'daemon off;'"]
