class Admin::EmployeeQueriesController < Admin::ApplicationController

  def index
    if params[:query] then

      if params[:query][:degree_value].present?
        value = params[:query][:degree_value]
        if value == 'masters'
          criteria = "employee_educations.level = 1"
        elsif value == 'doctorate'
          criteria = "employee_educations.level = 2"
        elsif value == 'both'
          criteria = "(employee_educations.level = 1 OR employee_educations.level = 2)"
        end

        @employees = Employee.includes(:educations).where(criteria).order('employee_educations.level DESC').references(:employee_educations)
        return @employees
      end

      if params[:query][:gender_value].present?
        value = params[:query][:gender_value]
        if value == 'male'
          criteria = "gender = 'M'"
        elsif value == 'female'
          criteria = "gender = 'F'"
        elsif value == 'both'
          criteria = "gender = 'M' OR gender = 'F' "
        end
      end

      if params[:query][:rank_value].present?
        value = params[:query][:rank_value]
        criteria = "academic_ranking_id = #{value}"
      end

      if params[:query][:specialization_value].present?
        value = params[:query][:specialization_value]
        criteria = "specialization_id = #{value}"
      end

      if criteria.present?
        @employees = Employee.includes(:rank, :specialization).where(criteria)
        # render html: @employees.to_sql and return true
        # render html: params and return true

        # @leaves = Leave.includes(:employee).where(criteria, values).order(filed_at: :desc)        
      else
        flash.now.alert = "No criteria found in your search. Please provide necessary data in the fields below."
        render :index
      end

    end   # if params[:query]
  end   # def index

end   # class Admin::EmployeeQueriesController