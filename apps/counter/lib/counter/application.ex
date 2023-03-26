defmodule Counter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Counter.Counter, 10}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Counter.Supervisor)
  end
end
