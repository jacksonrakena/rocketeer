defmodule RocketeerWeb.RedirectionController do
  use RocketeerWeb, :controller

  alias Rocketeer.Main
  alias Rocketeer.Main.Redirection

  def index(conn, _params) do
    redirections = Main.list_redirections()
    render(conn, "index.html", redirections: redirections)
  end

  def new(conn, _params) do
    changeset = Main.change_redirection(%Redirection{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"redirection" => redirection_params}) do
    case Main.create_redirection(redirection_params) do
      {:ok, redirection} ->
        conn
        |> put_flash(:info, "Redirection created successfully.")
        |> redirect(to: Routes.redirection_path(conn, :show, redirection))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    redirection = Main.get_redirection!(id)
    render(conn, "show.html", redirection: redirection)
  end

  def edit(conn, %{"id" => id}) do
    redirection = Main.get_redirection!(id)
    changeset = Main.change_redirection(redirection)
    render(conn, "edit.html", redirection: redirection, changeset: changeset)
  end

  def update(conn, %{"id" => id, "redirection" => redirection_params}) do
    redirection = Main.get_redirection!(id)

    case Main.update_redirection(redirection, redirection_params) do
      {:ok, redirection} ->
        conn
        |> put_flash(:info, "Redirection updated successfully.")
        |> redirect(to: Routes.redirection_path(conn, :show, redirection))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", redirection: redirection, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    redirection = Main.get_redirection!(id)
    {:ok, _redirection} = Main.delete_redirection(redirection)

    conn
    |> put_flash(:info, "Redirection deleted successfully.")
    |> redirect(to: Routes.redirection_path(conn, :index))
  end
end
