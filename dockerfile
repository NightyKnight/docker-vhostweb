#Dockerfile to create a simple Apache webserver
FROM httpd:2.4

#Copy Apache configuration file
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./my-httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
#create directories for websites
RUN mkdir -p /var/www/example.com/public_html
RUN mkdir -p /var/www/test.com/public_html

#modify permissions on /var/www
RUN chmod -R 755 /var/www

#copy contents of websites
COPY ./example.com/ /var/www/example.com/
COPY ./test.com/ /var/www/test.com/
