Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :excel_sheets do
    resources :sheets, except: [:index] do
      resources :columns, except: [:index] do
        resources :rows
      end
    end
  end
  post "excel_sheets/upload", to: "excel_sheets#upload"
  get "excel_sheets/remove_excel_sheets/:id", to: "excel_sheets#remove"
  resources :home, only: [:index]
  root "excel_sheets#index" 
end
