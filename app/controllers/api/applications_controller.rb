class Api::ApplicationsController < ApplicationController

  before_action :authenticate_user
  
  def create
    @application = Application.new(
      user_id: current_user.id,
      project_id: params[:project_id],
      note: params[:note],
    )

    if @application.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @application.errors.full_messages}, status: 422
    end
  end

  def show
    application_id = params[:id]
    @application = Application.find_by(id: application_id)
    render 'show.json.jbuilder'
  end

  def update
    @application = Application.find(params[:id])

    @application.user_id = params[:user_id] || @application.user_id
    @application.project_id = params[:project_id] || @application.project_id
    @application.note = params[:note] || @application.note
    @application.offered = params[:offered] || @application.offered
    @application.accepted = params[:accepted] || @application.accepted
    @application.favorite = params[:favorite] || @application.favorite
    
    if @application.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @application.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    render json: {message: "Application succesfully destroyed!"}
  end

end
