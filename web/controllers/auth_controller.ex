defmodule Auth.AuthController do
  use Auth.Web, :controller

  def index(conn, %{"provider" => provider}) do
    redirect conn, external: authorize_url!(provider)
  end

  def callback(conn, %{"provider" => provider, "code" => code}) do
    token = get_token!(provider, code)
    user = get_user!(provider, token)

    conn
    |> put_session(:current_user, user)
    |> put_session(:access_token, token.access_tocken)
    |> redirect(to: "/")
  end

  defp authorize_url!("google") do
    Google.authorize_url!(scope: "email profile")
  end

  defp authorize_url!(_) do
    raise "No matching provider avaliable"
  end

  defp authorize_url!("google", code) do
    user_url = "https://www.googleapis.com/plus/v1/people/me/openIdConnect"
    OAuth2.AccessToken.get!(token, user_url)
  end

  defp authorize_url(_,  _) do
    raise "No matching provider avaliable"
  end
end
