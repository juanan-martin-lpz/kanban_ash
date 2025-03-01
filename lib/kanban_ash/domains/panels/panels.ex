defmodule KanbanAsh.Panels do
  use Ash.Domain, otp_app: :kanban_ash, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
  end
end
