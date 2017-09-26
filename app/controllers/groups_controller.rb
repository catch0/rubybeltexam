class GroupsController < ApplicationController
    before_action :user_authorized, only: [:index, :create]
    def index
        @user = User.find(session[:user_id])
        @groups = Group.all
    end
    
    def show 
       user = current_user
        @group = Group.find(params[:id])
        @members = Member.all.includes(:group, :user)
        @members_in_ids = @group.members_in_ids
    end
    
    def create
        @group = Group.create(group_params.merge(user:current_user))
        if @group.valid?
            redirect_to '/groups'
        else
        flash[:errors] = @group.errors.full_messages
            redirect_to '/groups'
        end
    end
    
    def destroy
        Group.destroy(params[:id])
        redirect_to '/groups'
    end
        
        
        
    private
    def group_params
        params.require(:group).permit(:name, :description)
    end
end
