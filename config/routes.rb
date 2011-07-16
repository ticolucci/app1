App1::Application.routes.draw do
  post "/users", :to => "emails#create"
  root :to => "emails#new"
end
