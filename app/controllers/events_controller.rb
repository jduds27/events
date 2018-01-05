class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def home
    @events = Event.all
  end

  def index
    @event = Event.all
  end

  def show_all
    @event = Event.all
  end

  def show
    @event
    @location = "2912+Executive+Pkwy,Lehi,UT"
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def home
    @events = Event.all
  end

  def edit
  end

  def create
    @event = current_user.events.create!(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Your event was created'}
      else
        format.html {
          render :new
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Your event was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Your event was deleted.' }
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params

      params.require(:event).permit(:title, :body, :user_id)

      params.require(:event).permit(:title, :body, :image, :thumb_image)

    end
end