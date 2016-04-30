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

  def reduce([last_event | rest_of_events]) do
    last_event
  end

end
