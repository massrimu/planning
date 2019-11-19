Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects do
    resources :improvements do
    	member do
    		put "like" => "improvements#vote"
    	end
    end
  end


  resources :principles

  resources :books

  devise_for :users

  get 'about/index'

  get 'welcome/index'

#  authenticated :user do |variable|
#    root 'dashboard#index', as: 'authenticated_root'
#  end

  root 'welcome#index'

end
