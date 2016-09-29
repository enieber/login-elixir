defmodule Google do
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  def client do
    OAuth2.Client.new([
      strategy: __MODULE__,
      client_id: System.get.env(CLIENT_ID)
      client_secret: System.get.env(CLIENT_SECRET)
      redirect_uri: System.get.env(REDIRECT_URI)
      site: "https://accounts.google.com",
      authorize_url: "https://accounts.google.com/o/oauth2/auth",
      token_url: "https://accounts.google.com/o/oauth2/token"
    ])
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.get_token!(client(), params, headers)
  end

  # Strategy callback

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, header)
  end
end
