defmodule CartApi.CartView do

    use CartApi.Web, :view

    def render(conn, %{user: user}) do
      user
    end

end
