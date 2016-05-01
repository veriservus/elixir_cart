defmodule CartApi.CartView do
  use CartApi.Web, :view

  def render(conn, %{json_response: json_response}) do
    json_response
  end
end
