module CCE
  module WorkExperience
    
    def referrer
      if params[:redirect].present?
        admin_employee_cce_record_path(@employee)
      else
        admin_employee_work_experiences_path
      end
    end

  end
end
