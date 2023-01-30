defmodule Rocketeer.Repo.Migrations.CreateRedirections do
  use Ecto.Migration

  def change do
    create table(:redirections) do
      add :name, :string
      add :target, :string
      add :views, :integer

      timestamps()
    end

    create unique_index(:redirections, [:name])
  end
end
