FROM ubuntu:14.04

ENV tmp_dir /tmp

WORKDIR ${tmp_dir}

RUN apt-get update \
  && apt-get install -y curl wget vim \
  && curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  && apt-get install -y nodejs

RUN npm install -g json-server

#ADD test.json /tmp
RUN echo '{"cars":[{"id":1,"brand":"opel","model":"corsa"},{"id":2,"brand":"ford","model":"fiesta"}]}' > /tmp/test.json

ADD entrypoint.sh ${tmp_dir}

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
