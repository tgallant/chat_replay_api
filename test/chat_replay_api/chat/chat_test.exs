defmodule ChatReplayApi.ChatTest do
  use ChatReplayApi.DataCase

  alias ChatReplayApi.Chat

  describe "messages" do
    alias ChatReplayApi.Chat.Messages

    @valid_attrs %{body: "some body", replay_time: 120.5, topic: "some topic", user: "some user"}
    @update_attrs %{body: "some updated body", replay_time: 456.7, topic: "some updated topic", user: "some updated user"}
    @invalid_attrs %{body: nil, replay_time: nil, topic: nil, user: nil}

    def messages_fixture(attrs \\ %{}) do
      {:ok, messages} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chat.create_messages()

      messages
    end

    test "list_messages/0 returns all messages" do
      messages = messages_fixture()
      assert Chat.list_messages() == [messages]
    end

    test "get_messages!/1 returns the messages with given id" do
      messages = messages_fixture()
      assert Chat.get_messages!(messages.id) == messages
    end

    test "create_messages/1 with valid data creates a messages" do
      assert {:ok, %Messages{} = messages} = Chat.create_messages(@valid_attrs)
      assert messages.body == "some body"
      assert messages.replay_time == 120.5
      assert messages.topic == "some topic"
      assert messages.user == "some user"
    end

    test "create_messages/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_messages(@invalid_attrs)
    end

    test "update_messages/2 with valid data updates the messages" do
      messages = messages_fixture()
      assert {:ok, messages} = Chat.update_messages(messages, @update_attrs)
      assert %Messages{} = messages
      assert messages.body == "some updated body"
      assert messages.replay_time == 456.7
      assert messages.topic == "some updated topic"
      assert messages.user == "some updated user"
    end

    test "update_messages/2 with invalid data returns error changeset" do
      messages = messages_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_messages(messages, @invalid_attrs)
      assert messages == Chat.get_messages!(messages.id)
    end

    test "delete_messages/1 deletes the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{}} = Chat.delete_messages(messages)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_messages!(messages.id) end
    end

    test "change_messages/1 returns a messages changeset" do
      messages = messages_fixture()
      assert %Ecto.Changeset{} = Chat.change_messages(messages)
    end
  end
end
