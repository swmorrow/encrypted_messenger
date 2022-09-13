defmodule EMClientTest do
  use ExUnit.Case
  doctest EMClient

  test "greets the world" do
    assert EMClient.hello() == :world
  end
end
