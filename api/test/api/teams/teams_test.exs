defmodule Api.TeamsTest do
  use Api.DataCase

  alias Api.Teams

  describe "teams" do
    alias Api.Teams.Team

    @valid_attrs %{dynamics: 42, name: "some name", practices: 42, size: 42, team_size: 42}
    @update_attrs %{dynamics: 43, name: "some updated name", practices: 43, size: 43, team_size: 43}
    @invalid_attrs %{dynamics: nil, name: nil, practices: nil, size: nil, team_size: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Teams.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Teams.create_team(@valid_attrs)
      assert team.dynamics == 42
      assert team.name == "some name"
      assert team.practices == 42
      assert team.size == 42
      assert team.team_size == 42
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, team} = Teams.update_team(team, @update_attrs)
      assert %Team{} = team
      assert team.dynamics == 43
      assert team.name == "some updated name"
      assert team.practices == 43
      assert team.size == 43
      assert team.team_size == 43
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end
end
