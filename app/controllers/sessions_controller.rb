class SessionsController < ApplicationController
    def login

    end
    
    def user_login
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:notice] = 'Invalid username or password'
          redirect_to login_path
        end
    end
    
    def logout
        session.delete(:user_id)
        session[:user_id] = nil
        flash[:notice] = 'You have sucessfully logged out!'
        redirect_to login_path
    end
end