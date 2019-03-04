class Customer::SessionController < ApplicationController
    def new
        
    end
    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            log_in(@user)
            if @user.role == "Admin"
                redirect_to admin_path
            else
                flash[:notice] = "Logged in"
                redirect_to users_show_url
            end
        else
            flash[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
    def pay
        @user=User.new
        if @user = User.find_by_id(session[:usersid])
            @time=Time.now + 30*24*3600
            @user.validity=@time
            @user.role_type="Paid"
            @user.save
            flash[:notice]= "Paid Successfuly"
            redirect_to users_show_path
       end
    end
    def destroy
        session[:userid] =nil
        flash[:notice]= "Logged Out"
        redirect_to login_path
    end
end
