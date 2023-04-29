defmodule Helpdesk.Router do
  use Plug.Router

  plug(AshGraphql.Plug)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  forward("/playground",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [
      schema: Helpdesk.Schema,
      interface: :playground
    ]
  )

  forward("/gql",
    to: Absinthe.Plug,
    init_opts: [schema: Helpdesk.Schema]
  )

  get "/status" do
    send_resp(conn, 200, "OK")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
