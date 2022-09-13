defmodule EMServerTest do
  use ExUnit.Case
  doctest EMServer

  test "greets the world" do
    assert EMServer.hello() == :world
  end
end
