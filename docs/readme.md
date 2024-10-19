# `v6-vbb.nicu.ro` documentation

[`v6-vbb.nicu.ro`](https://v6-vbb.nicu.ro/) is a [REST API](https://restfulapi.net) for the public transportation system of [Berlin](https://en.wikipedia.org/wiki/Berlin) & [Brandenburg](https://en.wikipedia.org/wiki/Brandenburg), [VBB](https://en.wikipedia.org/wiki/Verkehrsverbund_Berlin-Brandenburg).

[![API status](https://badgen.net/uptime-robot/status/m795395649-8f5aea4c2dfb44f32f70c4e4)](https://stats.uptimerobot.com/n0GVMhlmzK/795395649)

Because it wraps [a VBB API](https://github.com/public-transport/hafas-client/blob/6/readme.md#background), it **includes all local traffic, as well as some long-distance trains running in the area**. Essentially, it returns whatever data the [VBB app](https://www.vbb.de/fahrplan/vbb-app) shows, **including realtime delays and disruptions**.

- [Getting Started](getting-started.md)
- [API documentation](api.md)
- [OpenAPI playground](https://petstore.swagger.io/?url=https%3A%2F%2Fv6-vbb.nicu.ro%2F.well-known%2Fservice-desc%0A)

## Why use this API?

### Realtime Data

This API returns realtime data whenever its upstream, the [API for VBB's mobile app](https://github.com/public-transport/hafas-client/blob/33d7d30acf235c54887c6459a15fe581982c6a19/p/vbb/readme.md), provides it.

### No API Key

You can just use the API without authentication. There's a [rate limit](https://apisyouwonthate.com/blog/what-is-api-rate-limiting-all-about) of 100 requests/minute set up.

### CORS

This API has [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) enabled, so you can query it from any webpage.

### Caching-friendly

This API sends [`ETag`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) & [`Cache-Control`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control) headers, allowing clients cache responses properly.
