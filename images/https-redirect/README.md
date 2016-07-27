# https-redirect
This image creates a container that redirects HTTP calls (port 80) to HTTPS (port 443).

### Testing image
1. Run an app, for example nginx (original image)
  ```
  $ docker run --name nginx -it --rm -p 80:80 nginx
  ```

2. Build image
  ```
  $ docker build -t http-redirect-nginx .
  ```
  
3. Run container
  ```
  $ docker run -e "PROXY_HOST=nginx" -it --link nginx -p 81:80 --rm http-redirect-nginx
  ```

4. Finally.. curl
  ```
  curl -i -H "X-Forwarded-Proto: http" localhost:81/blablabla
  ...
  HTTP/1.1 301 Moved Permanently
  Server: nginx/1.11.1
  Date: Thu, 02 Jun 2016 11:00:16 GMT
  Content-Type: text/html
  Content-Length: 185
  Connection: keep-alive
  Location: https://localhost/blablabla
  ```
