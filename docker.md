### install and run via Docker

1. To build

```shell
git clone https://github.com/nicufarmache/vbb-rest.git
cd vbb-rest
git checkout 5
npm install --production
docker build --no-cache --progress plain --network host -t vbb-rest-nicu .
```

1. To start
```shell
docker run -d -p 3000:3000 --name vbb-rest-nicu vbb-rest-nicu
```

or with host network

```shell
docker run -d --network=host --name vbb-rest-nicu vbb-rest-nicu
```