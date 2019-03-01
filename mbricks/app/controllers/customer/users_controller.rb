class Customer::UsersController < ApplicationController
    def new
        @user=User.new
    end
    def add
        @user = User.new
        respond_to do |format|
          format.html
          format.json {render :json => @user}
        end
    end




    def show
    end

    def create
        
        @user = User.new(user_params)

        if @user.save
            redirect_to root_path
          else
            render 'new'
        end
    end


    private
    def user_params
        params.require(:user).permit(:name,:email,:contact_number,:password, :password_confirmation)

    end
    
end
