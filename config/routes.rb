# frozen_string_literal: true

Rails.application.routes.draw do
 devise_for :users, skip: :all 

 namespace :api do
    namespace :v1, defaults: { format: :json } do
      namespace :auth do
        post   'sign_up',  to: 'registrations#create'
        post   'sign_in',  to: 'sessions#create'
        delete 'sign_out', to: 'sessions#destroy'
      end
      
      get 'me', to: 'profiles#show'
    
      resources :shipments, only: [:index, :show, :create] do
        
      end
    end
  end
end
