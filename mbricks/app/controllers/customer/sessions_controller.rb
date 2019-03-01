class Customer::SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            log_in(:user)
            flash.now[:alert] = "No file found!"
            redirect_to users_show_url
        else
            flash[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
    
    def destroy
        session[:userid] =nil
        redirect_to login_path, notice: "Logged Out"
    end
end
