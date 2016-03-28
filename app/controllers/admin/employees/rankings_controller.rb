class Admin::Employees::RankingsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_ranking, only: [:show, :edit, :update, :destroy]
  before_action :set_nbc_and_rank_name, only: [:new, :edit, :create, :update]

  layout 'employee_profile'


  def index
    @rankings = @employee.rankings
  end

  def show
  end

  def new
    @ranking = @employee.rankings.new(current_rank: @rank_full_name)
  end

  def create
    params[:ranking][:nbc_id] = session[:nbc_id]
    params[:ranking][:current_rank] = session[:rank_full_name]

    @ranking = @employee.rankings.new(ranking_params)
    respond_to do |format|
      if @ranking.save
        format.html {
          redirect_to admin_employee_rankings_path(@employee),
          notice: 'Ranking successfully performed. Please check your achieved rank.'
        }
      else
        format.html { render :new }
      end
    end
  end
 
  def edit  
  end
   
  def update
    respond_to do |format|    
      if @ranking.update(ranking_params)
        format.html {
          redirect_to edit_admin_employee_ranking_path(@employee, @ranking),
          notice: 'Ranking was successfully updated. Please review your achieved rank.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ranking.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_rankings_path(@employee),
        notice: 'Ranking was successfully deleted.' 
      }
    end
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_ranking
    @ranking = @employee.rankings.find(params[:id])
  end

  def set_nbc_and_rank_name
    @nbc_name = NBC.find(session[:nbc_id]).name if session[:nbc_id]
    session[:rank_full_name] = @employee.rank.full_name
    session[:rank_name] = @employee.rank.name
    @rank_full_name = session[:rank_full_name]
  end

  def ranking_params
    params.require(:ranking).permit(:nbc_id, :cce_total_points, :qce_total_points, :current_rank, :achieved_rank)
  end

end