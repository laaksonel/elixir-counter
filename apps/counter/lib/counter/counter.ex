defmodule Counter.Counter do
  use GenServer

  def start_link(initial_value), do: GenServer.start_link(__MODULE__, initial_value)

  def init(init_arg) do
    {:ok, init_arg}
  end

  def inc(pid), do: GenServer.cast(pid, :inc)

  def dec(pid), do: GenServer.cast(pid, :dec)

  def val(pid), do: GenServer.call(pid, :val)

  def handle_cast(:inc, val) do
    {:noreply, val + 1}
  end

  def handle_cast(:dec, val) do
    {:noreply, val - 1}
  end

  def handle_call(:val, _from, val) do
    {:reply, val, val}
  end
end
