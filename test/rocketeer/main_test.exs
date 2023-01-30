defmodule Rocketeer.MainTest do
  use Rocketeer.DataCase

  alias Rocketeer.Main

  describe "redirections" do
    alias Rocketeer.Main.Redirection

    import Rocketeer.MainFixtures

    @invalid_attrs %{name: nil, target: nil, views: nil}

    test "list_redirections/0 returns all redirections" do
      redirection = redirection_fixture()
      assert Main.list_redirections() == [redirection]
    end

    test "get_redirection!/1 returns the redirection with given id" do
      redirection = redirection_fixture()
      assert Main.get_redirection!(redirection.id) == redirection
    end

    test "create_redirection/1 with valid data creates a redirection" do
      valid_attrs = %{name: "some name", target: "some target", views: 42}

      assert {:ok, %Redirection{} = redirection} = Main.create_redirection(valid_attrs)
      assert redirection.name == "some name"
      assert redirection.target == "some target"
      assert redirection.views == 42
    end

    test "create_redirection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Main.create_redirection(@invalid_attrs)
    end

    test "update_redirection/2 with valid data updates the redirection" do
      redirection = redirection_fixture()
      update_attrs = %{name: "some updated name", target: "some updated target", views: 43}

      assert {:ok, %Redirection{} = redirection} = Main.update_redirection(redirection, update_attrs)
      assert redirection.name == "some updated name"
      assert redirection.target == "some updated target"
      assert redirection.views == 43
    end

    test "update_redirection/2 with invalid data returns error changeset" do
      redirection = redirection_fixture()
      assert {:error, %Ecto.Changeset{}} = Main.update_redirection(redirection, @invalid_attrs)
      assert redirection == Main.get_redirection!(redirection.id)
    end

    test "delete_redirection/1 deletes the redirection" do
      redirection = redirection_fixture()
      assert {:ok, %Redirection{}} = Main.delete_redirection(redirection)
      assert_raise Ecto.NoResultsError, fn -> Main.get_redirection!(redirection.id) end
    end

    test "change_redirection/1 returns a redirection changeset" do
      redirection = redirection_fixture()
      assert %Ecto.Changeset{} = Main.change_redirection(redirection)
    end
  end
end
