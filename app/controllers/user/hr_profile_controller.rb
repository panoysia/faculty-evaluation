class User::HRProfileController < User::ApplicationController

  before_action :profile


  def update_personal_info
    profile_update(personal_info_params)
  end

  def update_gov_membership_info
    profile_update(gov_membership_info_params)
  end

  def update_addresses_info
    profile_update(addresses_info_params)
  end


  private


  def profile
    @profile = @current_user.account
  end

  alias_method :get_profile, :profile


  def profile_update(params)
    if profile.update(params)
      redirect_to hr_profile_path,
                  notice: "Profile was successfully updated."
    else
      render :show
    end
  end

  def personal_info_params
    params.require(:employee).permit(
      :first_name, :middle_name, :last_name, :name_extension, :gender,
      :civil_status, :birth_date, :height, :weight, :blood_type,
      :citizenship, :cellphone_no, :email_address
    )
  end

  def gov_membership_info_params
    params.require(:employee).permit(:gsis_no, :pagibig_no,
                                      :philhealth_no, :tin,
                                      :agency_employee_no, :sss_no)
  end

  def addresses_info_params
    params.require(:employee).permit(
      :r_address, :r_zip_code, :r_telephone_no,
      :p_address, :p_zip_code, :p_telephone_no
    )
  end

end
