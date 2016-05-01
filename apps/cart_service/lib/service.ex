defmodule CartService.Service do
  defp make_event(item, action, count) do
    %{item: item, action: action, ts: System.system_time, count: count}
  end

  def empty_cart do
    []
  end

  def add_item(state, item) do
    append_event(state, make_event(item, :add, 1))
  end

  def remove_item(state, item) do
    append_event(state, make_event(item, :remove, -1))
  end

  def append_event(state, event) do
    [ event | state ]
  end
 
  def reduce([]) do
    nil
  end

  def reduce(state) do
    Enum.reduce state, %{}, fn el, acc ->
      Map.update(acc, el.item, %{count: el.count}, &(%{count: &1.count + el.count}))
    end
  end
end
