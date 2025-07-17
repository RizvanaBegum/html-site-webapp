# Use official Apache HTTP server image
FROM httpd:2.4

# Change Apache to listen on port 8080 (to avoid port 80 permission issues in OpenShift)
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Copy all files from repo root into Apache's web root
COPY . /usr/local/apache2/htdocs/

# Expose port 8080
EXPOSE 8080

# Start Apache in the foreground
CMD ["httpd-foreground"]
