defmodule ChatReplayApi.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user, :string
      add :body, :string
      add :replay_time, :float
      add :topic, :string

      timestamps()
    end

  end
end
