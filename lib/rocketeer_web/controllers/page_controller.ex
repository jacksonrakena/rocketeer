defmodule RocketeerWeb.PageController do
  use RocketeerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
