defmodule KanbanAsh.Accounts do
  use Ash.Domain, otp_app: :kanban_ash, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource KanbanAsh.Accounts.Token
    resource KanbanAsh.Accounts.User
  end
end
