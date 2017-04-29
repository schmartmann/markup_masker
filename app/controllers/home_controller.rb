class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to "/excel_sheets#index"
    else
      redirect_to "/devise/sessions#new"
    end
  end

end
