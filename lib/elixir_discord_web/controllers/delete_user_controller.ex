defmodule ElixirDiscordWeb.DeleteUserController do
  use ElixirDiscordWeb, :controller

  def index(conn, _) do
    deletedUser = conn.query_params

    Mongo.delete_one(:mongo, "users", deletedUser)

    conn
    |> json(%{ code: 200, status: "user deleted"})
  end
end
