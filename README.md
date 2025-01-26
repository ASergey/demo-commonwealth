# The Commonwealth Demo

This is a Ruby On Rails API demo project. Please, use docker compose to run it.

```bash
docker compose build
docker compose run --rm backend .dockerdev/entrypoints/setup.sh
docker compose up -d
```

To try API requests within swagger please follow the link: http://localhost:3000/docs

To run tests:

```bash
docker compose run --rm backend rspec
```
