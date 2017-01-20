class Admin::LeavesController < Admin::ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      criteria = ""  
      
      if params[:search][:academic_year_id].present?
        criteria << "(academic_year_id = #{params[:search][:academic_year_id]})"
      end

      if params[:search][:employee_id].present?
        if criteria.present?
          criteria << " AND (employee_id = #{params[:search][:employee_id]})"
        else
          criteria = "(employee_id = #{params[:search][:employee_id]})"
        end
      end
      
      # if params[:group_by_employees].present? then
      # end

      # render html: params and return true
      if criteria.present?
         @leaves = Leave.includes(:employee).where(criteria).order(filed_at: :desc)

        # if params[:group_by_employees].present? then
        #   Leave.
        # end
        if params[:search][:employee_id].present? &&
          params[:search][:academic_year_id].present?
            
            employee_id = params[:search][:employee_id]
            academic_year_id = params[:search][:academic_year_id]

            @employee = Employee.find(employee_id)
            @academic_year = AcademicYear.find(academic_year_id)
            
            @total_leaves = Leave.where(employee_id: employee_id, academic_year_id: academic_year_id).sum(:length)
            
            @service_credits = LeaveServiceCredit.where(employee_id: employee_id, academic_year_id: academic_year_id).sum(:no_of_days)

            @remaining_leaves = Leave.remaining(employee_id, academic_year_id)

            #@remaining_leaves = 15 - Leave.where(employee_id: employee_id, academic_year_id: academic_year_id).sum(:length)

            # @remaining_leaves = 15 - @total_leaves
        end
        
      else
        # from clicking Search button with no parameters        
        @leaves = Leave.includes(:employee).order(filed_at: :desc)
      end
    else
      # from request /admin/leaves
      @leaves = Leave.includes(:employee).order(filed_at: :desc)
    end   # params[:search]

  end   # index

  # def indexes
    
  #   values = {}

  #   if params[:search]
  #     if params[:academic_year_id].present?
  #       criteria = "academic_year_id = :academic_year_id"
  #       values[:academic_year_id] = params[:academic_year_id]
  #     end

  #     if params[:employee_id].present?
  #       if criteria.present?
  #         criteria << " AND employee_id = :employee_id"
  #       else
  #         criteria = "employee_id = :employee_id"
  #       end

  #       values[:employee_id] = params[:employee_id]
  #     end
  #   end

  # end

  def show
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leave_params)
  
    respond_to do |format|
      if @leave.save
        format.html { redirect_to admin_leaves_path,
          notice: 'Leave was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to [:admin, @leave], notice: 'Leave was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to admin_leaves_path, notice: 'Leave was successfully deleted.' }
    end
  end


  private

  def set_leave
    @leave = Leave.find(params[:id])
  end  

  def leave_params
    params.require(:leave).permit(:filed_at, :start_at, :end_at, :length, :employee_id, :academic_year_id)
  end
      
end