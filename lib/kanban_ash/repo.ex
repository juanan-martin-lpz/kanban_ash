defmodule KanbanAsh.Repo do
  use Ecto.Repo,
    otp_app: :kanban_ash,
    adapter: Ecto.Adapters.Postgres
end
