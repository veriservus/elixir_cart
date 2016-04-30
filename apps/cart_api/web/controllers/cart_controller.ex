defmodule CartApi.CartController do

    use CartApi.Web, :controller

    def index(conn, %{"user" => user}) do
      render conn, user: user
    end

end
