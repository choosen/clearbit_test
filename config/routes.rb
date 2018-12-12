Rails.application.routes.draw do
  resources :companies
  post 'webhook/clearbit' => 'webhook#clearbit'
end
