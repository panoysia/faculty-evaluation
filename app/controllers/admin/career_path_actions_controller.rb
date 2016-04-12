class Admin::CareerPathActionsController < Admin::ApplicationController
  before_action :set_action, only: [:show, :edit, :update, :destroy]


  def index
    @actions = CareerPathAction.includes(:career_path).order(category: :asc)
  end

  def show
  end

  def new
    @action = CareerPathAction.new
  end

  def create
    @action = CareerPathAction.new(action_params)

    respond_to do |format|
      if @action.save
        format.html { redirect_to admin_career_path_actions_path, notice: 'Career path action was successfully created.' }
      else
        format.html { render :new }
      end
    end    

  end

  def edit
  end

  def update
    respond_to do |format|    
      if @action.update(action_params)
        format.html {
          redirect_to admin_career_path_actions_path,
          notice: 'Career path action was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @action.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_career_path_actions_path,
        notice: 'Career path action was successfully deleted.' 
      }
    end    
  end


  private  

  def set_action
    @action = CareerPathAction.find(params[:id])
  end

  def action_params
    params.require(:career_path_action).permit(:name, :start_at, :end_at, :description, :category, :career_path_id, :company)
  end

end