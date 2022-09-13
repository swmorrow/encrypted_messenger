defmodule EMServer.Server do
  use GenServer

  # Client

    def start_link(name) do
      GenServer.start_link(__MODULE__, name, name: name)
    end

    def ping(server) do
      GenServer.call(server, :ping)
    end

    def recv_msg(server, {user, msg}) do
      GenServer.call(server, {:recv_msg, {user, msg}})
    end

  # Server (callbacks)

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:ping, _from, name) do
    {:reply, :pong, name}
  end

  @impl true
  def handle_call({:recv_msg, {user, msg}}, _from, name) do
    IO.inspect("Receiving message", label: user)
    Node.list()
    |> IO.inspect()
    |> Enum.map(fn (dest) -> :rpc.call(dest, EMClient.Client, :broadcast_msg, [dest, user, msg]) |> IO.inspect() end)
    {:reply, :ok, name}
  end
end
