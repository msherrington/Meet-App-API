class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(Uploader.upload(event_params))
    @event.user = current_user

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    return render json: { errors: ["Unauthorized"] } if @event.user != current_user
    if @event.update(Uploader.upload(event_params))
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @event.user != current_user
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :location, :date, :description, :max_tickets, :tickets_left, :price, :base64, :user_id, :latitude, :longitude, :tickets, attendee_ids:[])
    end
end
