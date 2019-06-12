class Api::UsersController < ApplicationController

  before_action :authenticate_user

  def create
     @user = User.new(
       first_name: params[:first_name],
       last_name: params[:last_name],
       email: params[:email],
       password: params[:password],
       password_confirmation: params[:password_confirmation]
     )

     if @user.save
       render json: {message: 'User created successfully'}, status: :created
     else
       render json: {errors: @user.errors.full_messages}, status: :bad_request
     end
  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    render 'show.json.jbuilder'

    # if @user = current.user get user.application 
  end

  def update
    @user = User.find(params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.password_digest = params[:password_digest] || @user.password_digest
    @user.image = params[:image] || @user.image
    @user.address = params[:address] || @user.address
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.imdb_url = params[:imdb_url] || @user.imdb_url
    @user.resume = params[:resume] || @user.resume
    @user.current_job_title = params[:current_job_title] || @user.current_job_title

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "User succesfully destroyed!"}
  end

end
