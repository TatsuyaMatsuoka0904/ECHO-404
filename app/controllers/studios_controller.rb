class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
  end

  def index
    @studio = Studio.ransack(params[:q])
    @studios = @studio.result(distinct: true)
  end
  
 
  def edit
    @studio = Studio.find(params[:id])
    if @studio == current_studio
    else
      redirect_to studio_path(current_studio)
    end
  end

  def update
    @studio = Studio.find(params[:id])
    if @studio.update(studio_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to studio_path
    else
      render "edit"
    end
  end
  protected
  
  def studio_params
    params.require(:studio).permit(:name, :image_id, :introduction,:address)
  end
  
  def correct_studio
   @studio = Studio.find(params[:id])
   if current_studio != @studio
    redirect_to studio_path(current_studio.id)
   end
  end
  
end
