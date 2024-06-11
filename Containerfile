FROM registry.redhat.io/rhel9/rhel-bootc:9.4

#install the lamp components
RUN dnf module enable -y php:8.2 nginx:1.22 && dnf install -y httpd mariadb mariadb-server php-fpm php-mysqlnd && dnf clean all

#start the services automatically on boot
RUN systemctl enable httpd mariadb php-fpm

#create a cool home page!
RUN echo "\
<!DOCTYPE html>\n\
<html lang=\"en\">\n\
<head>\n\
    <meta charset=\"UTF-8\">\n\
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n\
    <title>Cool PHP Page</title>\n\
    <style>\n\
        body {\n\
            font-family: Arial, sans-serif;\n\
            background: linear-gradient(to right, #4facfe, #00f2fe);\n\
            display: flex;\n\
            justify-content: center;\n\
            align-items: center;\n\
            height: 100vh;\n\
            margin: 0;\n\
            color: white;\n\
            text-align: center;\n\
        }\n\
        .container {\n\
            background: rgba(0, 0, 0, 0.7);\n\
            padding: 20px;\n\
            border-radius: 10px;\n\
        }\n\
        h1 {\n\
            font-size: 3em;\n\
            margin: 0;\n\
        }\n\
        p {\n\
            font-size: 1.2em;\n\
        }\n\
        .time {\n\
            font-size: 2em;\n\
            margin-top: 10px;\n\
        }\n\
    </style>\n\
</head>\n\
<body>\n\
    <div class=\"container\">\n\
        <h1>Welcome to My Cool PHP Page</h1>\n\
        <p><?php echo \"Today is \" . date(\"l, F j, Y\") . \".\"; ?></p>\n\
        <p class=\"time\"><?php echo \"The current time is \" . date(\"h:i A\"); ?></p>\n\
    </div>\n\
</body>\n\
</html>" > index.php