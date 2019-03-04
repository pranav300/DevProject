module SessionHelper
    def log_in(user)
        session[:usersid] = @user.id
    end
end
