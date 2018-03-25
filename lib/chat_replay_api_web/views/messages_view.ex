defmodule ChatReplayApiWeb.MessagesView do
  use ChatReplayApiWeb, :view
  alias ChatReplayApiWeb.MessagesView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessagesView, "messages.json")}
  end

  def render("show.json", %{messages: messages}) do
    %{data: render_one(messages, MessagesView, "messages.json")}
  end

  def render("messages.json", %{messages: messages}) do
    %{id: messages.id,
      user: messages.user,
      body: messages.body,
      replay_time: messages.replay_time,
      topic: messages.topic}
  end
end
