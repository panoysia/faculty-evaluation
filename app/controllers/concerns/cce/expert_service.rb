module CCE
  module ExpertService

    def referrer
      if params[:redirect].present?
        admin_employee_cce_record_path(@employee)
      else
        admin_employee_expert_services_path
      end
    end

  end
end