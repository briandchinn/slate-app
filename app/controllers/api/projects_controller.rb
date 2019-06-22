class Api::ProjectsController < ApplicationController

  before_action :authenticate_user
  
  def index
    @projects = Project.all
    render "index.json.jbuilder"
  end

  def create
    @project = Project.new(
      title: params[:title],
      description: params[:description],
      address: params[:address],
      start_date: params[:start_date],
      end_date: params[:end_date],
      number_of_positions: params[:number_of_positions],
      user_id: current_user.id,
    )

    if @project.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  def show
    project_id = params[:id]
    @project = Project.find_by(id: project_id)
    render 'show.json.jbuilder'
  end

  def update
    @project = Project.find(params[:id])

    @project.title = params[:title] || @project.title
    @project.description = params[:description] || @project.description
    @project.address = params[:address] || @project.address
    @project.start_date = params[:start_date] || @project.start_date
    @project.end_date = params[:end_date] || @project.end_date
    @project.number_of_positions = params[:number_of_positions] || @project.number_of_positions
    @project.user_id = params[:user_id] || @project.user_id
    
    if @project.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @project.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    render json: {message: "Project succesfully destroyed!"}
  end

end
