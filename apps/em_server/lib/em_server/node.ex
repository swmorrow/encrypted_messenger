defmodule EMServer.Node do
  def start(name, cookie) do
    {:ok, _pid} = Node.start(name)
    Node.set_cookie(Node.self(), cookie)
    :ok
  end

  def stop() do
    Node.stop()
  end
end
