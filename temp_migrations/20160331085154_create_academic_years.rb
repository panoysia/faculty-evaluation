class CreateAcademicYears < ActiveRecord::Migration
  def change
    create_table :academic_years do |t|
      t.date :start_at, null: false
      t.date :end_at, null: false

      t.timestamps null: false
    end
  end
end
