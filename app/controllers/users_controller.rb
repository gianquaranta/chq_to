class UsersController < ApplicationController
    before_action :authenticate_user!
    #before_action :authorize_user, only: [:show]
  
    def show
      @user = current_user
    end
  
    private
  
    def authorize_user
      if @user != current_user
        render file: "#{Rails.root}/public/403.html", layout: false
      end
    end
  end