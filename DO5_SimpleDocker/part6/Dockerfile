FROM nginx:1.28.1

COPY server/server.c /server.c
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && \
    apt-get install -y gcc libfcgi-dev spawn-fcgi && \
    gcc /server.c -o /server.fcgi -lfcgi && \
    useradd -m galya && \
    chown -R galya /var/cache/nginx /var/log/nginx /etc/nginx && \
    touch /run/nginx.pid && \
    chown galya /run/nginx.pid && \
    rm -rf /var/lib/apt/lists/*

USER galya

CMD ["sh", "-c", "spawn-fcgi -p 8080 /server.fcgi && nginx -g 'daemon off;'"]
