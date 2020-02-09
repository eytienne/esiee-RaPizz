# esiee-RaPizz
Projet base de données 1

### run database
`docker-compose up -d postgres`

### stop database
`docker-compose stop`

### connect to database
`psql --host=localhost --username postgres --dbname rapizz`

### retest all

`psql --host=localhost --username postgres --dbname rapizz -f sql/drop_all.sql -f sql/schema_definition.sql -f sql/command_trigger.sql -f sql/delivery_trigger.sql -f sql/queries.sql -f sql/dataset.sql`