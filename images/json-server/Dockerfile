FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  && apt-get install -y nodejs

RUN npm install -g json-server

#ADD cars.json /tmp
RUN echo '{"cars":[{"id":1,"brand":"opel","model":"corsa"},{"id":2,"brand":"ford","model":"fiesta"}]}' > /tmp/cars.json

CMD json-server --watch /tmp/cars.json --port 8080
