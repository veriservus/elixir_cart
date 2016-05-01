defmodule CartApi.CartController do
  use CartApi.Web, :controller
  alias CartService.CartAgent, as: CartAgent
  import String, only: [to_atom: 1]

  defp r(data, conn) do
    render conn, json_response: data
  end

  def create(conn, %{"user" => user}) do
    {:ok, pid } = CartAgent.start_link(to_atom(user))
    r %{ created: user }, conn
  end

  def add(conn, %{"user" => user, "item" => item}) do
    CartAgent.add_item(to_atom(user), to_atom(item))
    r %{ added: [user, item] }, conn
  end

  def remove(conn, %{"user" => user, "item" => item}) do
    CartAgent.remove_item(to_atom(user), to_atom(item))
    r %{ removed: [user, item] }, conn
  end

  def show(conn, %{"user" => user}) do
    user 
    |> to_atom
    |> CartAgent.current_state
    |> r(conn)
  end
  
end
