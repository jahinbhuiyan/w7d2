class SessionsController < ApplicationController

    before_action :require_logged_in, only:[:destroy]
    before_action :require_logged_out, only:[:new, :create]


    def create
        @user = Users.find_by_credentials(params[:user][:username], params[:user][:username])

        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            puts @user.errors.full_messages
            render :new 
        end
    end

    def new
        render :new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end