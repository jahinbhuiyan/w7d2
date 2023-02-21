class UsersController < ApplicationController
    
    before_action :require_logged_in, only:[:show]
    before_action :require_logged_out, only:[:new, :create]

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # login(@user)
            redirect_to users_url
        else
            render :new
    end

    def show
        @user = User.find(params[:id])

        render :show
    end

    private
    def user_params
        params.require(:user).permit(:usrename, :session_token, :password_digest, :email, :password)
    end
end