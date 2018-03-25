defmodule ChatReplayApiWeb.MessagesControllerTest do
  use ChatReplayApiWeb.ConnCase

  alias ChatReplayApi.Chat
  alias ChatReplayApi.Chat.Messages

  @create_attrs %{body: "some body", replay_time: 120.5, topic: "some topic", user: "some user"}
  @update_attrs %{body: "some updated body", replay_time: 456.7, topic: "some updated topic", user: "some updated user"}
  @invalid_attrs %{body: nil, replay_time: nil, topic: nil, user: nil}

  def fixture(:messages) do
    {:ok, messages} = Chat.create_messages(@create_attrs)
    messages
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all messages", %{conn: conn} do
      conn = get conn, messages_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create messages" do
    test "renders messages when data is valid", %{conn: conn} do
      conn = post conn, messages_path(conn, :create), messages: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, messages_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some body",
        "replay_time" => 120.5,
        "topic" => "some topic",
        "user" => "some user"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, messages_path(conn, :create), messages: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update messages" do
    setup [:create_messages]

    test "renders messages when data is valid", %{conn: conn, messages: %Messages{id: id} = messages} do
      conn = put conn, messages_path(conn, :update, messages), messages: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, messages_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some updated body",
        "replay_time" => 456.7,
        "topic" => "some updated topic",
        "user" => "some updated user"}
    end

    test "renders errors when data is invalid", %{conn: conn, messages: messages} do
      conn = put conn, messages_path(conn, :update, messages), messages: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete messages" do
    setup [:create_messages]

    test "deletes chosen messages", %{conn: conn, messages: messages} do
      conn = delete conn, messages_path(conn, :delete, messages)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, messages_path(conn, :show, messages)
      end
    end
  end

  defp create_messages(_) do
    messages = fixture(:messages)
    {:ok, messages: messages}
  end
end
