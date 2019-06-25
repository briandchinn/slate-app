class Api::NotificationsController < ApplicationController

  before_action :authenticate_user
  
  def index
    @notifications = current_user.notifications
    render 'index.json.jbuilder'
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    render json: {message: "Notification succesfully destroyed!"}
  end
  
end
