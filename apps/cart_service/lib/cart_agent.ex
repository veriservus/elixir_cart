defmodule CartAgent do
  alias CartService

 def start_link do
   Agent.start_link(fn -> [] end)
 end

 def add_item(cart_agent, item) do
   Agent.update(cart_agent, fn cart -> CartService.add_item(cart, item) end)
 end

 def current_state(cart_agent) do
   Agent.get(cart_agent, fn cart -> CartService.reduce(cart) end)
 end

end
