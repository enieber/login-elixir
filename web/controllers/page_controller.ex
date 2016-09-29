defmodule Auth.PageController do
  use Auth.Web, :controller

  def index(conn, _params) do
    conn
    |> assing(:current_user, get_session(conn, :current_user))
    |> render "index.html"
  end
end
