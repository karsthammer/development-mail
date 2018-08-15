# Development mail

A small docker-compose setup for running a mailserver and webmail client
that can be used as a local catch all webmail interface.

To use:

```
docker-compose up
```

After it has started, webmail will be available on [http://localhost:8080](http://localhost:8080)
and the SMTP server will be listening on `localhost:2525`

If you need more safety, feel free to update the `CATCHALL_PASSWORD` in the `docker-compose.yml`
