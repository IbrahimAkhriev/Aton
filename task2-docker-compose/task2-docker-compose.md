# Task 2 — Docker Compose: HTTPS-сервер на NGINX

## Описание
Настраивает HTTPS веб-сервер с самоподписанным сертификатом и редиректом с 80 на 443.

## Структура
```
task2-docker-compose/
├── Dockerfile
├── docker-compose.yml
├── nginx/
│   ├── nginx.conf
│   ├── cert.crt
│   └── cert.key
├── html/
│   └── index.html
```

## Команда запуска
```bash
docker-compose up --build
```

## Проверка
```bash
curl -vk https://localhost:443
```

## результата curl в текстовом формате
tracyger@DESKTOP-F8ENJIK:~$ curl -vk https://localhost:443
, offering h2
* ALPN, offering http/1.1
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: C=RU; ST=Moscow; L=Moscow; O=DevOps; CN=localhost
*  start date: May  6 13:00:57 2025 GMT
*  expire date: May  6 13:00:57 2026 GMT
*  issuer: C=RU; ST=Moscow; L=Moscow; O=DevOps; CN=localhost
*  SSL certificate verify result: self-signed certificate (18), continuing anyway.
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET / HTTP/1.1
> Host: localhost
> User-Agent: curl/7.81.0
> Accept: */*
>
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Server: nginx/1.27.5
< Date: Tue, 06 May 2025 14:40:39 GMT
< Content-Type: text/html
< Content-Length: 157
< Last-Modified: Tue, 06 May 2025 13:06:56 GMT
< Connection: keep-alive
< ETag: "681a0970-9d"
< Accept-Ranges: bytes
<
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>HTTPS Test</title>
</head>
<body>
  <h1>Хочу в Атон</h1>
</body>
</html>

* Connection #0 to host localhost left intact