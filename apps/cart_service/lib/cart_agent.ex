defmodule CartService.CartAgent do
  alias CartService.Service, as: Service 

  def start_link(user) do
    Agent.start_link(&Service.empty_cart/0, name: user)
  end

  def start_link do
    Agent.start_link(&Service.empty_cart/0)
  end

  def add_item(cart_agent, item) do
    Agent.update(cart_agent, &Service.add_item(&1, item))
  end

  def remove_item(cart_agent, item) do
    Agent.update(cart_agent, &Service.remove_item(&1, item))
  end

  def current_state(cart_agent) do
    Agent.get(cart_agent, &Service.reduce(&1))
  end
end
