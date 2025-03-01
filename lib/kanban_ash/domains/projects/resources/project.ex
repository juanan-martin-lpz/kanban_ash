defmodule KanbanAsh.Projects.Project do
  use Ash.Resource,
    domain: KanbanAsh.Projects,
    extensions: [
      AshJsonApi.Resource,
      AshGraphql.Resource,
      AshAdmin.Resource
    ], data_layer: AshPostgres.DataLayer

  admin do
    actor? true
  end

  postgres do
    table "projects"
    repo KanbanAsh.Repo
  end

  actions do
    default_accept [:name, :description]

    create :create do
      change set_attribute(:status, :not_started)
      change set_attribute(:priority, 1)
    end

    read :read do
      primary? true
    end

    read :read_by_id do
      get_by :id
    end

    update :update
    destroy :delete
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      allow_nil? false
      public? true
    end

    attribute :status, :atom do
      constraints one_of: [
                    :not_started,
                    :ongoing,
                    :completed,
                    :abandoned,
                    :on_hold,
                    :cancelled,
                    :archived,
                    :moved
                  ]
      public? true
    end

    attribute :priority, :integer do
      public? true
    end

    attribute :start_date, :date do
      allow_nil? true
      public? true
    end

    attribute :end_date, :date do
      allow_nil? true
      public? true
    end

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  graphql do
    type :project

    queries do
      get :project, :read
      list :projects, :read
    end

    mutations do
      create :create_project, :create
      update :update_project, :update
      destroy :destroy_project, :delete
    end
  end
end
