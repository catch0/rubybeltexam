class UsersController < ApplicationController
    def index
    end
    
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id]=user.id
            redirect_to '/groups'
        else 
            flash[:reg_errors] = user.errors.full_messages
            redirect_to '/'
        end
            
    end
    
    private
    def user_params
        params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
    end
end
