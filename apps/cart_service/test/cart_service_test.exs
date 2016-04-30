defmodule CartServiceTest do
  use ExUnit.Case
  doctest CartService

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "adding and removing events" do
    # Figure how to stub the time or fix this somehow
    computed_state = CartService.add_item([], :food) |> CartService.add_item(:something_else) |> CartService.remove_item(:food)
    expected_state = [%{action: :remove, item: :food, ts: 1462020085968145237},
                      %{action: :add, item: :something_else, ts: 1462020085968142323},
                      %{action: :add, item: :food, ts: 1462020085968137966}]

    assert computed_state == expected_state
  end
end
