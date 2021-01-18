class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
  end

  def index
    @studios = Studio.all
  end
end
