## Usage

The entrypoint is Bash and `psql` is on the PATH.

To connect to a PostgreSQL database:

```shell
docker run --rm -it lamoreesoftware/pgsql:12
...
psql -h database.zone.internal -p 5432 -U postgres -d postgres
```
