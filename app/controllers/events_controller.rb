class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "カレンダーに記入しました"
      redirect_to user_path(id: current_user)
    else
      flash[:info] = "カレンダーの記入に失敗しました"
      redirect_to new_event_path
    end
  end

  # def create
  #   @micropost = current_user.microposts.build(micropost_params)
  #   if @micropost.save
  #     flash[:success] = "Micropost created!"
  #     redirect_to root_url
  #   else
  #     render 'static_pages/home'
  #   end
  # end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time)
    end
end
