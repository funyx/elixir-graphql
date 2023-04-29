import Config

# Configure your database
config :helpdesk, Helpdesk.Repo,
  username: "elixir",
  password: "elixir",
  hostname: "db.phinix.com",
  database: "elixir",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
