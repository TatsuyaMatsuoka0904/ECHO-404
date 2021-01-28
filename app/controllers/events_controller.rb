class EventsController < ApplicationController
  # skip_before_action :authenticate, only: :show
  def new
    @event = current_studio.created_events.build
  end

  def create
    @event = current_studio.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      root_path
    end
  end

  def index
    @events = Event.all
    @event = Event.where(start_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month).reorder(:start_at).order(start_at: 'ASC')
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy

  end


  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at, :performer)
  end
end
