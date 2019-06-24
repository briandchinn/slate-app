Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/projects" => "projects#index"
    post "/projects" => "projects#create"
    get "/projects/:id" => "projects#show"
    patch "/projects/:id" => "projects#update"
    delete "/projects/:id" => "projects#destroy"

    post "/applications" => "applications#create"
    get "/applications/:id" => "applications#show"
    patch "/applications/:id" => "applications#update"
    delete "/applications/:id" => "applications#destroy"

    post "/notifications" => "notifications#create"
    get "/notifications" => "notifications#index"
    delete "/notifications/:id" => "notifications#destroy"

    post "sessions" => "sessions#create"
  end

end
