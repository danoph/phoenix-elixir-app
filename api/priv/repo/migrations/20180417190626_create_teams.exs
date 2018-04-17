defmodule Api.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :size, :integer
      add :dynamics, :integer
      add :team_size, :integer
      add :practices, :integer

      timestamps()
    end

  end
end
