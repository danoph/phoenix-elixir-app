defmodule Api.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset


  schema "teams" do
    field :dynamics, :integer
    field :name, :string
    field :practices, :integer
    field :size, :integer
    field :team_size, :integer

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :size, :dynamics, :team_size, :practices])
    |> validate_required([:name, :size, :dynamics, :team_size, :practices])
  end
end
