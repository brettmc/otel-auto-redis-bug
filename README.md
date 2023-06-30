```shell
docker compose build php
docker compose up -d redis
docker compose run php php redis.php
```
