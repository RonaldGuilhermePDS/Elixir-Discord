defmodule ElixirDiscordWeb.UpdateUserController do
  use ElixirDiscordWeb, :controller

  def index(conn, _) do
    userId = conn.body_params
    |>Map.get("_id")

    userName = conn.body_params
    |> Map.get("name")

    userEmail = conn.body_params
    |> Map.get("email")

    Mongo.update_one(:mongo, "users", %{_id: userId}, %{"$set": %{name: userName}})
    Mongo.update_one(:mongo, "users", %{_id: userId}, %{"$set": %{email: userEmail}})

    conn
    |> json(%{ code: 200, status: "user updated" })
  end
end
