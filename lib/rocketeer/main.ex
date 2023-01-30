defmodule Rocketeer.Main do
  @moduledoc """
  The Main context.
  """

  import Ecto.Query, warn: false
  alias Rocketeer.Repo

  alias Rocketeer.Main.Redirection

  @doc """
  Returns the list of redirections.

  ## Examples

      iex> list_redirections()
      [%Redirection{}, ...]

  """
  def list_redirections do
    Repo.all(Redirection)
  end

  @doc """
  Gets a single redirection.

  Raises `Ecto.NoResultsError` if the Redirection does not exist.

  ## Examples

      iex> get_redirection!(123)
      %Redirection{}

      iex> get_redirection!(456)
      ** (Ecto.NoResultsError)

  """
  def get_redirection!(id), do: Repo.get!(Redirection, id)

  @doc """
  Creates a redirection.

  ## Examples

      iex> create_redirection(%{field: value})
      {:ok, %Redirection{}}

      iex> create_redirection(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_redirection(attrs \\ %{}) do
    %Redirection{}
    |> Redirection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a redirection.

  ## Examples

      iex> update_redirection(redirection, %{field: new_value})
      {:ok, %Redirection{}}

      iex> update_redirection(redirection, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_redirection(%Redirection{} = redirection, attrs) do
    redirection
    |> Redirection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a redirection.

  ## Examples

      iex> delete_redirection(redirection)
      {:ok, %Redirection{}}

      iex> delete_redirection(redirection)
      {:error, %Ecto.Changeset{}}

  """
  def delete_redirection(%Redirection{} = redirection) do
    Repo.delete(redirection)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking redirection changes.

  ## Examples

      iex> change_redirection(redirection)
      %Ecto.Changeset{data: %Redirection{}}

  """
  def change_redirection(%Redirection{} = redirection, attrs \\ %{}) do
    Redirection.changeset(redirection, attrs)
  end
end
