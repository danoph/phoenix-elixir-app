defmodule ApiWeb.TeamControllerTest do
  use ApiWeb.ConnCase

  alias Api.Teams
  alias Api.Teams.Team

  @create_attrs %{dynamics: 42, name: "some name", practices: 42, size: 42, team_size: 42}
  @update_attrs %{dynamics: 43, name: "some updated name", practices: 43, size: 43, team_size: 43}
  @invalid_attrs %{dynamics: nil, name: nil, practices: nil, size: nil, team_size: nil}

  def fixture(:team) do
    {:ok, team} = Teams.create_team(@create_attrs)
    team
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all teams", %{conn: conn} do
      conn = get conn, team_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create team" do
    test "renders team when data is valid", %{conn: conn} do
      conn = post conn, team_path(conn, :create), team: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, team_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "dynamics" => 42,
        "name" => "some name",
        "practices" => 42,
        "size" => 42,
        "team_size" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, team_path(conn, :create), team: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update team" do
    setup [:create_team]

    test "renders team when data is valid", %{conn: conn, team: %Team{id: id} = team} do
      conn = put conn, team_path(conn, :update, team), team: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, team_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "dynamics" => 43,
        "name" => "some updated name",
        "practices" => 43,
        "size" => 43,
        "team_size" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, team: team} do
      conn = put conn, team_path(conn, :update, team), team: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete team" do
    setup [:create_team]

    test "deletes chosen team", %{conn: conn, team: team} do
      conn = delete conn, team_path(conn, :delete, team)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, team_path(conn, :show, team)
      end
    end
  end

  defp create_team(_) do
    team = fixture(:team)
    {:ok, team: team}
  end
end
