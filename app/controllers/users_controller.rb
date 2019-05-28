class UsersController < ApplicationController
    include UsersHelper

    def show
        # byebug
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        # not working for some reason
        # if @user.valid?
            
        # else
        #     #add different notices for errors
        #     flash[:notice] = 'User already exists!'
        #     redirect_to new_user_path
        # end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = 'You deleted your account!'
        redirect_to new_user_path
    end

end
