class HomesController < ApplicationController
  def index
    # @events = Event.all
    @events = Event.where('end_at > ?', DateTime.now).reorder(:end_at).order(star_at: 'ASC')
  end
end
