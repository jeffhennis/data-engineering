Challenge::Application.routes.draw do
  match "/"                        => "challenge#show", :via => [:get, :post]
  get  "/auth/google/callback"     => "auth#auth"
  post  "/auth/google/callback"    => "auth#auth"
  get   "/logout"                  => "challenge#logout"
end
