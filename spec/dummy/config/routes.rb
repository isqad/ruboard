Dummy::Application.routes.draw do
  mount Ruboard::Engine, :at => '/forums'
end
