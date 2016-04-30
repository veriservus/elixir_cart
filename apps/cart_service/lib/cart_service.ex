defmodule CartService do

  def append_event(state, event) do
    [ event | state ]
  end

  def reduce([]) do
    nil
  end

  def reduce([last_event | rest_of_events]) do
    last_event
  end

end
