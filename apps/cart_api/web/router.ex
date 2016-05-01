defmodule CartApi.Router do
  use CartApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CartApi do
    pipe_through :api

    get "/create/:user", CartController, :create
    get "/add/:user", CartController, :add
    get "/remove/:user", CartController, :remove
    get "/show/:user", CartController, :show
  end
end
