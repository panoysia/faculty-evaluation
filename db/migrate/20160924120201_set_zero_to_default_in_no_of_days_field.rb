class SetZeroToDefaultInNoOfDaysField < ActiveRecord::Migration
  
  DEFAULT_NO_OF_DAYS = 0

  def up
    change_column_default :employee_trainings,
                            :no_of_days, DEFAULT_NO_OF_DAYS
  end

  def down
    change_column :employee_trainings, :no_of_days,
                    :integer, default: DEFAULT_NO_OF_DAYS
  end
end
