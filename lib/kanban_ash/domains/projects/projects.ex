defmodule KanbanAsh.Projects do
  use Ash.Domain, otp_app: :kanban_ash, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource KanbanAsh.Projects.Project do
      define :create_project, action: :create
      define :update_project, action: :update
      define :read_projects, action: :read
      define :read_project_by_id, action: :read, get_by: :id
      define :delete_project, action: :delete
    end
  end
end
