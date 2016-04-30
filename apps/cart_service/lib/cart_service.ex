defmodule CartService do

  def add_item(state, item) do
    append_event(state, make_event(item, :add))
  end

  def remove_item(state, item) do
    append_event(state, make_event(item, :remove))
  end

  def append_event(state, event) do
    [ event | state ]
  end

  def make_event(item, action) do
    %{item: item, action: action, ts: System.system_time}
  end

  def reduce([]) do
    nil
  end

  def reduce(state) do
    Enum.reduce state, %{}, fn el, acc ->
      case el.action do
        :add -> IO.inspect el
        Map.update acc, el.item, %{cnt: 1}, fn cnt -> %{cnt: cnt.cnt+1} end
        _ -> IO.puts "blah"
      end
    end
  end

end
