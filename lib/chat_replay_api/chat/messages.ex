defmodule ChatReplayApi.Chat.Messages do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :body, :string
    field :replay_time, :float
    field :topic, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(messages, attrs) do
    messages
    |> cast(attrs, [:user, :body, :replay_time, :topic])
    |> validate_required([:user, :body, :replay_time, :topic])
  end
end
