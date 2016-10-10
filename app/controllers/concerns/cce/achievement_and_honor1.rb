module CCE
  module AchievementAndHonor1

    def referrer
      if params[:redirect].present?
        admin_employee_cce_record_path(@employee)
      else
        admin_employee_achievement_and_honors_1_path
      end
    end
    
  end
end