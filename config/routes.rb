Rails.application.routes.draw do

	root "home#top"
	get 'about' => "home#about"

#---users--
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :blogs, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
		resource :favorites, only:[:create, :destroy]
		resources :comments, only: [:create]
	end
	resources :contacts, only: [:new, :create]
	resources :users, only: [:index, :show, :edit, :update]
end
