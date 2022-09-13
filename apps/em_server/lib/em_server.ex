defmodule EMServer do
  @moduledoc """
  Documentation for `EMServer`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EMServer.hello()
      :world

  """
  def start(name, cookie) do
    atomized_name = name <> "@127.0.0.1" |> String.to_atom()
    EMServer.Server.start_link(atomized_name)
    EMServer.Node.start(atomized_name, cookie)
  end
end
