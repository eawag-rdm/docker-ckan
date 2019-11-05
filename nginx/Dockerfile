FROM nginx:alpine

COPY nginx.conf /etc/nginx/
RUN rm /etc/nginx/conf.d/*
COPY conf.d /etc/nginx/conf.d/
