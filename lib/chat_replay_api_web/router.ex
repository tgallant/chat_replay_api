defmodule ChatReplayApiWeb.Router do
  use ChatReplayApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChatReplayApiWeb do
    pipe_through :api
    resources "/messages", MessagesController, only: [:create, :show]
  end
end
