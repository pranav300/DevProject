class Customer::SessionController < ApplicationController
    def new
    end
    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            log_in(@user)
            flash[:notice] = "Logged in"
            render plain: "Hello,#{session[:user_id]}!"
        else
            flash[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
    def pay
        @user=User.new
        if @user = User.find_by(session[:user])
            @time=Time.now + 30*24*3600
            @user.validity=@time
            @user.role_type="Paid"
            @user.save
            flash[:notice]= "Paid Successfuly"
            redirect_to users_show_path
       end
    end
    def destroy
        session[:user] =nil
        flash[:notice]= "Logged Out"
        redirect_to login_path
    end
end
