Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :excel_sheets do
    resources :sheets do
      resources :columns do
        resources :rows
      end
    end
  end
  resources :home, only: [:index]
  root to: "home#index"
end
