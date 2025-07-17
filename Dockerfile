# Use official Apache HTTP server image
FROM httpd:2.4

# Optional: Change Apache to listen on port 8080 instead of 80
# OpenShift sometimes restricts binding to port 80
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Copy your website files into the Apache web directory
COPY ./html/ /usr/local/apache2/htdocs/

# Expose port 8080 (updated from default 80)
EXPOSE 8080

# Start Apache in the foreground
CMD ["httpd-foreground"]
