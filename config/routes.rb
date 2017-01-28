Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
    collection do
      get :search
    end
  resources :resumes
  end
  namespace :admin do
  	resources :jobs do
  		member do
			post :publish
			post :hide		
  		end
      resources :resumes
  	end
  end

  namespace :account do
    resources :jobs
  end
  root "welcome#index"


  controller :pages do
  get :about
end
end
