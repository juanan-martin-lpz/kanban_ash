defmodule KanbanAsh.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KanbanAshWeb.Telemetry,
      KanbanAsh.Repo,
      {DNSCluster, query: Application.get_env(:kanban_ash, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KanbanAsh.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KanbanAsh.Finch},
      # Start a worker by calling: KanbanAsh.Worker.start_link(arg)
      # {KanbanAsh.Worker, arg},
      # Start to serve requests, typically the last entry
      KanbanAshWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :kanban_ash]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KanbanAsh.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KanbanAshWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
