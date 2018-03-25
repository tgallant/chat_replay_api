defmodule ChatReplayApiWeb.MessagesController do
  use ChatReplayApiWeb, :controller

  alias ChatReplayApi.Chat
  alias ChatReplayApi.Chat.Messages

  action_fallback ChatReplayApiWeb.FallbackController

  def index(conn, _params) do
    messages = Chat.list_messages()
    render(conn, "index.json", messages: messages)
  end

  def create(conn, message) do
    IO.puts "YEAO"
    with {:ok, %Messages{} = message} <- Chat.create_messages(message) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", messages_path(conn, :show, message))
      |> render("show.json", messages: message)
    end
  end

  def show(conn, %{"id" => id}) do
    messages = Chat.list_messages_by_topic(id)
    render(conn, "index.json", messages: messages)
  end

  def update(conn, %{"id" => id, "messages" => messages_params}) do
    messages = Chat.get_messages!(id)

    with {:ok, %Messages{} = messages} <- Chat.update_messages(messages, messages_params) do
      render(conn, "show.json", messages: messages)
    end
  end

  def delete(conn, %{"id" => id}) do
    messages = Chat.get_messages!(id)
    with {:ok, %Messages{}} <- Chat.delete_messages(messages) do
      send_resp(conn, :no_content, "")
    end
  end
end
