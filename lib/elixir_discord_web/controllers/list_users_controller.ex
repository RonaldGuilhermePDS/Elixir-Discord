defmodule ElixirDiscordWeb.ListUsersController do
  use ElixirDiscordWeb, :controller

  def index(conn, params) do
    response =
      Mongo.find(:mongo, "users", params)
      |> Enum.to_list()

    conn
    |> json(response)
  end
end
