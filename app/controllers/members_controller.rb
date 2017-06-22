class MembersController < ApplicationController
    def create
        Member.create(user: current_user, group: Group.find(params[:id]))
        redirect_to '/groups'
    
    end
    
    def destroy
        Member.find_by(user:current_user, group: Group.find(params[:id])).destroy
        redirect_to '/groups'
    end
end
