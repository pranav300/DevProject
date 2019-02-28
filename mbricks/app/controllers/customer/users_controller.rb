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
    def create
        
        @user = User.new(article_params)

        if @user.save
            redirect_to root_path
          else
            render 'new'
        end
    end
    private
    def article_params
        params.require(:user).permit(:name,:email,:contact_number,:password,:password_confirmation,:validity)
    end
end
