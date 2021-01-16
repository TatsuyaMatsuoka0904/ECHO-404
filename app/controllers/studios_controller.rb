class StudiosController < ApplicationController
  def show
    @studio = current_studio
    # results = Geocoder.search(params[:address])
    # @latlng = results.first
    # respond_to do |format|
    #   format.js
    # end
  end

  def index
    @studios = Studio.all
  end
end
