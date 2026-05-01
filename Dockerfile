
FROM httpd

WORKDIR /usr/local/apache2/htdocs

COPY index.html .

EXPOSE 80

CMD ["httpd-foreground"]
