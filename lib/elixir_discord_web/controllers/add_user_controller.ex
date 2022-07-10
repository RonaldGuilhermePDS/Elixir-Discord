defmodule ElixirDiscordWeb.AddUserController do
  use ElixirDiscordWeb, :controller

  def index(conn, _) do
    newUser = conn.body_params
    |> Map.put("_id", UUID.uuid4())

    Mongo.insert_one(:mongo, "users", newUser)

    conn
    |> json(%{ code: 200, status: "user created" })
  end
end
