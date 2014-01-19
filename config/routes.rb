ReactRailsBackbone::Application.routes.draw do
  root "welcome#index"
  get "binding/index"
  get "todo/index"
end
