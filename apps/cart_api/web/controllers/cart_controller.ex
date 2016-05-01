defmodule CartApi.CartController do

    use CartApi.Web, :controller
    require CartService.CartAgent

    def create(conn, %{"user" => user}) do
      {:ok, pid} = CartService.CartAgent.start_link String.to_atom(user)
      render conn, json_response: %{ created: user }
    end

    def add(conn, %{"user" => user}) do
      CartService.CartAgent.add_item  String.to_atom(user), :food
      render conn, json_response: %{ added: [user, :food] }
    end

    def remove(conn, %{"user" => user}) do
      CartService.CartAgent.add_item  String.to_atom(user), :food
      render conn, json_response: %{ removed: [user, :food] }
    end

    def show(conn, %{"user" => user}) do
      state = CartService.CartAgent.current_state String.to_atom(user)
      render conn, json_response: state
    end

end
