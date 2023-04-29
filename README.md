# elixir graphql
### Local setup 
- copy `.devcontaier/example.env` as `.devcontaier/.env` and tune your local environment variables if needed
- [Follow these steps](https://code.visualstudio.com/docs/devcontainers/containers#_installation) to load the project in VSCode


### Managing the database
#### open a terminal inside the devcontainer and use the commands bellow
- create db and/or run all migrations 
    ```bash
    $ mix ash_postgres.create
    $ mix ash_postgres.migrate
    ```

- create a migration
    ```bash
    $ mix ash_postgres.generate_migrations --name ${MIGRATION_NAME}
    ```

- in case you need to reset the database - drop it and then recreate it
    ```bash
    $ mix ash_postgres.drop
    $ mix ash_postgres.create
    ```

### Running dev-server (iex)
#### open a terminal inside the devcontainer and use the command bellow
```bash
$ iex -S mix
```