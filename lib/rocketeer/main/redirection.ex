defmodule Rocketeer.Main.Redirection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "redirections" do
    field :name, :string
    field :target, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(redirection, attrs) do
    redirection
    |> cast(attrs, [:name, :target, :views])
    |> validate_required([:name, :target, :views])
    |> unique_constraint(:name)
  end
end
