class Api::NotificationsController < ApplicationController

  # before_action :authenticate_user
  
  def index
    @notifications = Notification.all
    render 'index.json.jbuilder'
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    render json: {message: "Notification succesfully destroyed!"}
  end
  
end
