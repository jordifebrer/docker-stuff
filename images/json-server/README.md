# json-server
The purpose of this image is to try json-server: [https://github.com/typicode/json-server](https://github.com/typicode/json-server)


Build and run image:
```sh
$ docker build -t jsonserver .
$ docker run --rm --name jsonserver-container -p 8080:8080 -it jsonserver
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

Add a remote json file
```sh
$ docker run --rm --name jsonserver-container -p 8080:8080 -e "file=https://REMOTE_FILE.json" -it jsonserver
```

Or copy a local file
```sh
$ docker cp MY_LOCAL_FILE.json jsonserver-container:/tmp/test.json
```

And finally.. we can do HTTP calls!! Example:

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
