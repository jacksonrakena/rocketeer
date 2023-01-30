defmodule Rocketeer.MainFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rocketeer.Main` context.
  """

  @doc """
  Generate a unique redirection name.
  """
  def unique_redirection_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a redirection.
  """
  def redirection_fixture(attrs \\ %{}) do
    {:ok, redirection} =
      attrs
      |> Enum.into(%{
        name: unique_redirection_name(),
        target: "some target",
        views: 42
      })
      |> Rocketeer.Main.create_redirection()

    redirection
  end
end
