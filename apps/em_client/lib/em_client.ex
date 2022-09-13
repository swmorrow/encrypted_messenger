defmodule EMClient do
  @moduledoc """
  Documentation for `EMClient`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EMClient.hello()
      :world

  """
  def log_in(username, server, cookie) do
    atomized_username = username <> "@127.0.0.1" |> String.to_atom()
    EMClient.Client.start_link(atomized_username)
    Node.start(atomized_username)
    Node.set_cookie(cookie)
    Node.connect(server)
  end
end
