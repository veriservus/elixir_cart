defmodule CartService.Service do

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
    List.foldr state, %{}, fn el, acc ->
      case el.action do
        :add -> IO.inspect el
        Map.update acc, el.item, %{cnt: 1}, fn cnt -> %{cnt: cnt.cnt+1} end
        :remove ->
          Map.update acc, el.item, %{cnt: 0}, fn cnt ->
            if cnt.cnt <= 0 do
              %{cnt: 0}
            else
              %{cnt: cnt.cnt-1}
            end
          end
        _ -> IO.puts "blah"
        acc
      end
    end
  end

end
