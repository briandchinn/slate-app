class Api::NotificationsController < ApplicationController

  before_action :authenticate_user
  
  def index
    @notifications = Notification.all
    render 'index.json.jbuilder'
  end

  def create
    @notification = Notification.new(
      user_id: current_user.id,
      # Need to figure out how to dynamically get this id. 
      application_id: 28,
      note: params[:note]
      )
    if @notification.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @notification.errors.full_messages}, status: 422
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    render json: {message: "Notification succesfully destroyed!"}
  end
  
end
