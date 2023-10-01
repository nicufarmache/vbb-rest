FROM node:alpine as builder
WORKDIR /app

# install dependencies
RUN apk add --update git bash
ADD package.json /app
RUN npm install --network=host

# build documentation
ADD . /app
RUN npm run build

# ---

FROM node:alpine
LABEL org.opencontainers.image.title="vbb-rest-nicu"
LABEL org.opencontainers.image.description="An HTTP API for Berlin & Brandenburg public transport."
LABEL org.opencontainers.image.authors="Jannis R <mail@jannisr.de>"
LABEL org.opencontainers.image.documentation="https://github.com/nicufarmache/vbb-rest/tree/5"
LABEL org.opencontainers.image.source="https://github.com/nicufarmache/vbb-rest"
LABEL org.opencontainers.image.revision="5"
LABEL org.opencontainers.image.licenses="ISC"
WORKDIR /app

# install dependencies
ADD package.json /app
RUN npm install --omit=dev --network=host && npm cache clean --force

# add source code
ADD . /app
COPY --from=builder /app/docs ./docs

EXPOSE 3905

ENV HOSTNAME v5-vbb.nicu.ro
ENV PORT 3905

CMD ["node", "index.js"]
