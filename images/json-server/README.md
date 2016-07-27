# json-server
The purpose of this image is to try json-server: [https://github.com/typicode/json-server](https://github.com/typicode/json-server)


Build and run image:
```sh
$ docker build -t jsonserver .
$ docker run -p 8080:8080 -it jsonserver
```

By default the image creates the following file /tmp/cars.json:

```json
{  
  "cars":[  
    {  
      "id":1,
      "brand":"opel",
      "model":"corsa"
    },
    {  
      "id":2,
      "brand":"ford",
      "model":"fiesta"
    }
  ]
}
```

Once the container/server we can easly do HTTP calls like:

> GET
```sh
$ curl http://0.0.0.0:8080/cars
```

> POST
```sh
$ curl -i -H "Accept: application/json" -H "Content-type: application/json" -d '{"brand":"seat","model":"ibiza"}' -X POST http://0.0.0.0:8080/cars
$ curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"brand":"seat","model":"ibiza"}' http://0.0.0.0:8080/cars
```

> PUT
```sh
$ curl -H "Accept: application/json" -H "Content-Type: application/json" -X PUT -d '{"brand":"opel","model":"astra"}' http://0.0.0.0:8080/cars/1
```

More info about json-server at:

[https://www.npmjs.com/package/jsonserver](https://www.npmjs.com/package/jsonserver)

[https://github.com/typicode/json-server](https://github.com/typicode/json-server)
