defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
#   resources "users", UserController do
#     resources "posts", PostController, only: [:index, :show]
#   end
#   resources "comments", CommentController, except: [:delete]

#   resources "reviews", ReviewController
  end

  # Other scopes may use custom stacks.
  scope "/api", HelloPhoenix do
    pipe_through :api

    resources "reviews", ReviewController
  end
end

# scope "/admin", HelloPhoenix.Admin, as: :admin do
#   pipe_through :browser

#   resources "/reviews", ReviewController
#   resources "/images", ImageController
#   resources "/users", UserController
# end

# scope "/api", HelloPhoenix.Api, as: :api do
#   pipe_through :api

#   scope "/v1", V1, as: :v1 do
#     resources "images",  ImageController
#     resources "reviews", ReviewController
#     resources "users",   UserController
#   end
# end
