Rails.application.routes.draw do
  resources :contact_details, only: [:new, :create], as: :contact_details
end
