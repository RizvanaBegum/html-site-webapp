FROM httpd:2.4

# Copy static files
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./css/ /usr/local/apache2/htdocs/css/

# Run apache in foreground as non-root and avoid pid file issue
RUN sed -i 's|^#ServerName.*|ServerName localhost|' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|^PidFile.*|#PidFile /usr/local/apache2/logs/httpd.pid|' /usr/local/apache2/conf/httpd.conf
