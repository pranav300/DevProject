module SessionHelper
    def log_in(user)
        session[:users_id] = @user.id
    end
end