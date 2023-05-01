defmodule Helpdesk.AuthPlug do
  use AshAuthentication.Plug, otp_app: :my_app

  def handle_success(conn, _activity, _user, token) do
    conn
    |> send_resp(
      200,
      Jason.encode!(%{
        authentication: %{
          success: true,
          token: token
        }
      })
    )
  end

  def handle_failure(conn, _activity, _reason) do
    conn
    |> send_resp(
      401,
      Jason.encode!(%{
        authentication: %{
          success: false
        }
      })
    )
  end
end
