defmodule CounterWeb.CounterLive.Index do
  use CounterWeb, :live_view

  alias Counter.Counter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :val, Counter.val())}
  end

  @impl true
  def handle_event("inc", _, socket) do
    Counter.inc()
    {:noreply, assign(socket, :val, Counter.val())}
  end

  @impl true
  def handle_event("dec", _, socket) do
    Counter.dec()
    {:noreply, assign(socket, :val, Counter.val())}
  end
end
