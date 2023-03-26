defmodule Counter.Counter do
  use GenServer

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end
  
  def init(init_arg) do
    {:ok, init_arg}
  end

  def inc() do
    GenServer.cast(__MODULE__, :inc)
  end

  def dec(), do: GenServer.cast(__MODULE__, :dec)

  def val(), do: GenServer.call(__MODULE__, :val)

  def topic, do: "count"

  def handle_cast(:inc, val) do
    new_count = val + 1
    {:noreply, new_count}
  end

  def handle_cast(:dec, val) do
    new_count = val - 1
    {:noreply, new_count}
  end

  def handle_call(:val, _from, val) do
    {:reply, val, val}
  end
end
