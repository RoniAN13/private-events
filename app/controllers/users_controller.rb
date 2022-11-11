class UsersController < ApplicationController

    def show
        @user= User.find(params[:id])
        @events= @user.events.all
        @attended_events = @user.attended_events
    end    
end
