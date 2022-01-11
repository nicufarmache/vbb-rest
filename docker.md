### install and run via Docker

```shell
git clone https://github.com/nicufarmache/vbb-rest.git
cd vbb-rest
git checkout 5
npm install --production
docker build -t vbb-rest-nicu .
docker run -d -p 3000:3000 --name vbb-rest-nicu vbb-rest-nicu
```