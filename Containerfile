FROM registry.redhat.io/rhel9/rhel-bootc:9.4

#install the lamp components
RUN dnf module enable -y php:8.2 nginx:1.22 && dnf install -y httpd mariadb mariadb-server php-fpm php-mysqlnd && dnf clean all

#start the services automatically on boot
RUN systemctl enable httpd mariadb php-fpm

#create a cool home page!
COPY index.php /var/www/html/