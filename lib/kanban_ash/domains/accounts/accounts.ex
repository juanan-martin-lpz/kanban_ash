defmodule KanbanAsh.Accounts do
  use Ash.Domain,
    otp_app: :kanban_ash

  resources do
    resource KanbanAsh.Accounts.Token
    resource KanbanAsh.Accounts.User
  end
end
