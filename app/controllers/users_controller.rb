class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users, include: ['events_created.comments', 'events_created.comments.user']
    # render json: @users, include: ['events_attending.comments', 'events_created.comments', 'events_attending.comments.user', 'events_created.comments.user']
  end

  # GET /users/1
  def show
    p @user
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(Uploader.upload(user_params))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /events
  # def create
  #   @event = Event.new(Uploader.upload(event_params))
  #   # @event = Event.new(event_params)
  #   @event.user = current_user
  #
  #   if @event.save
  #     render json: @event, status: :created, location: @event
  #   else
  #     render json: @event.errors, status: :unprocessable_entity
  #   end
  # end


  # PATCH/PUT /users/1
  def update
    if @user.update(Uploader.upload(user_params))
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   # return render json: { errors: ["Unauthorized"] } if @event.user != current_user
  #   if @event.update(Uploader.upload(event_params))
  #     render json: @event
  #   else
  #     render json: @event.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :base64, :bio, :password, :password_confirmation, events_attending_ids:[])
    end
end
