class AdminController < ApplicationController
    def new 

    end

    def index
        @user=User.all
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render xml: @user}
            format.json { render json: @user}
        end
    end
    def showuser
        @user = User.find(params[:id])
    end
end