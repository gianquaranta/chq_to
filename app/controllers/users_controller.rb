class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show]
    before_action :authorize_user, only: [:show]
  
    def show
      @user = current_user
    end
  
    private
  
    def set_user
      @user = User.find(params[:format])
    end
  
    def authorize_user
      unless @user == current_user
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
  end