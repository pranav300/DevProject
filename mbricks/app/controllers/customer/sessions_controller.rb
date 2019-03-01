class Customer::SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            log_in(:user)
            flash[:notice] = "Logged in"
            redirect_to users_show_url
        else
            flash[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
    def pay
        @user=User.new
        @user = User.find_by(session[:userid])
        @time=Time.now + 30*24*3600
        @user.validity=@time
        @user.save
        redirect_to users_show_path
    end
    def destroy
        session[:userid] =nil
        flash[:notice]= "Logged Out"
        redirect_to login_path
    end
end
