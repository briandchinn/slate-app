class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def create
    response = Cloudinary::Uploader.upload(params[:image], :transformation => [
    {:width=>400, :height=>400, :gravity=>"face", :radius=>"max", :crop=>"thumb"},
    {:width=>200, :crop=>"scale"}
    ])
    cloudinary_url = response["secure_url"]

    response = Cloudinary::Uploader.upload(params[:resume], :resource_type => :auto)
    cloudinary_url2 = response["secure_url"]

    @user = User.new(
     first_name: params[:first_name],
     last_name: params[:last_name],
     email: params[:email],
     password: params[:password],
     password_confirmation: params[:password_confirmation],
     image: cloudinary_url,
     address: params[:address],
     phone_number: params[:phone_number],
     imdb_url: params[:imdb_url],
     resume: cloudinary_url2,
     current_job_title: params[:current_job_title]
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
  end

  def update

    response = Cloudinary::Uploader.upload(params[:image],:transformation => [
    {:width=>400, :height=>400, :gravity=>"face", :radius=>"max", :crop=>"thumb"},
    {:width=>200, :crop=>"scale"}
    ])
    cloudinary_url = response["secure_url"]

    response = Cloudinary::Uploader.upload(params[:resume], :resource_type => :auto)
    cloudinary_url2 = response["secure_url"]

    @user = User.find(params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.password_digest = params[:password_digest] || @user.password_digest
    @user.image = cloudinary_url || @user.image
    @user.address = params[:address] || @user.address
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.imdb_url = params[:imdb_url] || @user.imdb_url
    @user.resume = cloudinary_url2 || @user.resume
    @user.current_job_title = params[:current_job_title] || @user.current_job_title

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    # @user.projects.update_all(user_id: nil)
    @user.destroy
    render json: {message: "User succesfully destroyed!"}
  end

  def user_params
    params.require(:user).permit(:name, :email, :login)
  end

end
