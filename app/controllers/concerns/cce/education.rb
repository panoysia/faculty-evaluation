module CCE
  module Education

    def referrer
      if params[:redirect].present?
        admin_employee_cce_record_path(@employee)
      else
        admin_employee_educations_path
      end
    end

  end
end
