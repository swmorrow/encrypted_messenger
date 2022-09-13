defmodule EMClient.Client do
  use GenServer

  # Client

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def ping(client) do
    GenServer.call(client, :ping)
  end

  def send_msg(msg) do
    :rpc.call(:"server@127.0.0.1", EMServer.Server, :recv_msg, [:"server@127.0.0.1", {node(), msg}])
    |> IO.inspect()
  end

  def broadcast_msg(client, sender, msg) do
    GenServer.call(client, {:broadcast_msg, sender, msg})
  end

  # Server (callbacks)

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:ping, _from, name) do
    :rpc.call(:"server@127.0.0.1", EMServer.Server, :ping, [:"server@127.0.0.1"])
    |> IO.inspect()
    {:reply, :ok, name}
  end

  @impl true
  def handle_call({:broadcast_msg, sender, msg}, _from, name) do
    IO.inspect(msg, label: sender)
    {:reply, :ok, name}
  end
end
