class Api::ApplicationsController < ApplicationController

  before_action :authenticate_user
  
  def create
    @application = Application.new(
      user_id: current_user.id,
      project_id: params[:project_id],
      note: params[:note],
    )

    if @application.save
      @notification = Notification.create(
        user_id: @application.project.user.id,
        application_id: @application.id,
        note: "#{current_user.first_name } applied to #{@application.project.title}. Personal Note: #{@application.note}"
        )
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

    if params[:offered]
      @application.offered = true
    else
      @application.offered = false
    end

    if params[:accepted]
      @application.accepted = true
    else
      @application.accepted = false
    end 

    if params[:favorite]
      @application.favorite = true
    else
      @application.favorite = false
    end    
    
    if @application.save && params[:offered] == true
      
    # Need to add conditional here because multiple notifications will need to go to different users. if params[:offered] == true then notify applicant. if params[:accepted] == true then notify project owner. 

    @notification = Notification.create(
      user_id: @application.user.id,
      application_id: @application.id,
      note: "#{@application.project.user.first_name} #{@application.project.user.last_name} has hired you for #{@application.project.title}. Personal Note: #{@application.note}"
      )
    render 'show.json.jbuilder'

    elsif @application.save && params[:accepted] == true

    # Notification for offer accepted by applicant. Notification goes to project owner. 
    @notification = Notification.create(
      user_id: @application.project.user.id,
      application_id: @application.id,
      note: "#{@application.user.first_name} #{@application.user.last_name} has accepted your offer for #{@application.project.title}"
      )
    render 'show.json.jbuilder'

    elsif @application.save
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
