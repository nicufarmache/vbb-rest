FROM node:18-alpine as builder
WORKDIR /app

# install dependencies
RUN apk add --update git bash
ADD package.json /app
RUN npm install

# build documentation
ADD . /app
RUN npm run build

# ---

FROM node:18-alpine
LABEL org.opencontainers.image.title="vbb-rest-nicu"
LABEL org.opencontainers.image.description="An HTTP API for Berlin & Brandenburg public transport."
LABEL org.opencontainers.image.authors="Jannis R <mail@jannisr.de>"
LABEL org.opencontainers.image.documentation="https://github.com/nicufarmache/vbb-rest/tree/6"
LABEL org.opencontainers.image.source="https://github.com/nicufarmache/vbb-rest"
LABEL org.opencontainers.image.revision="6"
LABEL org.opencontainers.image.licenses="ISC"
WORKDIR /app

# install dependencies
RUN apk add --update git
ADD package.json /app
RUN npm install --production && npm cache clean --force

# add source code
ADD . /app
COPY --from=builder /app/docs ./docs

EXPOSE 3006

ENV HOSTNAME v6-vbb.nicu.ro
ENV PORT 3006

CMD ["node", "index.js"]
