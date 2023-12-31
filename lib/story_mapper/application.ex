defmodule StoryMapper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StoryMapperWeb.Telemetry,
      # Start the Ecto repository
      StoryMapper.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StoryMapper.PubSub},
      # Start Finch
      {Finch, name: StoryMapper.Finch},
      # Start the Endpoint (http/https)
      StoryMapperWeb.Endpoint
      # Start a worker by calling: StoryMapper.Worker.start_link(arg)
      # {StoryMapper.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StoryMapper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StoryMapperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
