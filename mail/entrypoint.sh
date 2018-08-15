#!/bin/sh

if [[ -z "$CATCHALL_PASSWORD" ]]; then
  echo 'Error: CATCHALL_PASSWORD should be set'
  exit 1
fi

# Generate a SSL certificate
if [[ ! -f /cert/cert.pem ]]; then
  openssl req -x509 -newkey rsa:4096 -keyout /cert/key.pem -nodes -out /cert/cert.pem -days 3650 -subj '/CN=mail'
fi

if [[ ! -f /cert/dh.pem ]]; then
  openssl dhparam -dsaparam -out /cert/dh.pem 4096
fi

# Update password for catchall user
cat /etc/dovecot/dovecot-passwd.tpl | envsubst > /etc/dovecot/dovecot-passwd

supervisord -c /etc/supervisord.conf
