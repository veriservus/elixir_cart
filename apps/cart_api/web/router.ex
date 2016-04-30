defmodule CartApi.Router do
  use CartApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CartApi do
    pipe_through :api
  end
end
