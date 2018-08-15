FROM alpine:3.8

RUN apk add --no-cache postfix dovecot supervisor gettext openssl

RUN mkdir /cert

# Add a user for storing the email
RUN ["/usr/sbin/adduser", "catchall", "-D"]

# Copy configuration files
COPY etc /etc/
COPY entrypoint.sh /entrypoint.sh

# Update aliases db
RUN postalias /etc/postfix/aliases

# Create the users maildir
USER catchall:catchall
RUN mkdir /home/catchall/Maildir

USER root:root
EXPOSE 25
EXPOSE 587
EXPOSE 143
EXPOSE 993

CMD ["/entrypoint.sh"]
