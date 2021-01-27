class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
  end

  def index
    @studio = Studio.ransack(params[:q])
    @studios = @studio.result(distinct: true)
  end
end
