defmodule RocketeerWeb.RedirectionControllerTest do
  use RocketeerWeb.ConnCase

  import Rocketeer.MainFixtures

  @create_attrs %{name: "some name", target: "some target", views: 42}
  @update_attrs %{name: "some updated name", target: "some updated target", views: 43}
  @invalid_attrs %{name: nil, target: nil, views: nil}

  describe "index" do
    test "lists all redirections", %{conn: conn} do
      conn = get(conn, Routes.redirection_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Redirections"
    end
  end

  describe "new redirection" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.redirection_path(conn, :new))
      assert html_response(conn, 200) =~ "New Redirection"
    end
  end

  describe "create redirection" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.redirection_path(conn, :create), redirection: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.redirection_path(conn, :show, id)

      conn = get(conn, Routes.redirection_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Redirection"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.redirection_path(conn, :create), redirection: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Redirection"
    end
  end

  describe "edit redirection" do
    setup [:create_redirection]

    test "renders form for editing chosen redirection", %{conn: conn, redirection: redirection} do
      conn = get(conn, Routes.redirection_path(conn, :edit, redirection))
      assert html_response(conn, 200) =~ "Edit Redirection"
    end
  end

  describe "update redirection" do
    setup [:create_redirection]

    test "redirects when data is valid", %{conn: conn, redirection: redirection} do
      conn = put(conn, Routes.redirection_path(conn, :update, redirection), redirection: @update_attrs)
      assert redirected_to(conn) == Routes.redirection_path(conn, :show, redirection)

      conn = get(conn, Routes.redirection_path(conn, :show, redirection))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, redirection: redirection} do
      conn = put(conn, Routes.redirection_path(conn, :update, redirection), redirection: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Redirection"
    end
  end

  describe "delete redirection" do
    setup [:create_redirection]

    test "deletes chosen redirection", %{conn: conn, redirection: redirection} do
      conn = delete(conn, Routes.redirection_path(conn, :delete, redirection))
      assert redirected_to(conn) == Routes.redirection_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.redirection_path(conn, :show, redirection))
      end
    end
  end

  defp create_redirection(_) do
    redirection = redirection_fixture()
    %{redirection: redirection}
  end
end
