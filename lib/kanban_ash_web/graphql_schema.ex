defmodule KanbanAshWeb.GraphqlSchema do
  use Absinthe.Schema

  use AshGraphql, domains: [KanbanAsh.Projects],
                  generate_sdl_file: "priv/schema.graphql",
                  auto_generate_sdl_file?: true

  import_types Absinthe.Plug.Types

  query do
  end

  mutation do
    # Custom Absinthe mutations can be placed here
  end

  subscription do
    # Custom Absinthe subscriptions can be placed here
  end
end
