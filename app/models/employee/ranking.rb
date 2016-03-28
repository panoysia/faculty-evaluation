class Employee::Ranking < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee
  belongs_to :nbc, class_name: 'NBC'

  validates :cce_total_points, :qce_total_points, presence: true
  validates :current_rank, presence: true

  before_save :get_achieved_rank
  after_save :update_employee_rank

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end
  
  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end


  private

  def update_employee_rank
    employee.update(rank: @new_rank)  
  end

  def get_achieved_rank
    chopped_rank_name = self[:current_rank].chop.chop
    # puts "#{chopped_rank_name}"
    if self[:cce_total_points] < self[:qce_total_points]
      category = :cce
      lowest_point = self[:cce_total_points]
    else
      category = :qce
      lowest_point = self[:qce_total_points]   
    end

    if category == :cce      
      result = AcademicRanking.where("(:points >= cce_min_points AND :points <= cce_max_points) AND (name = :name)", { points: lowest_point, name: chopped_rank_name })
      # result = AcademicRanking.where(":points >= cce_min_points AND :points <= cce_max_points", { points: lowest_point })

      if result
        @new_rank = result.first
        self[:achieved_rank] = result.first.full_name 
      end

      #puts result.first.full_name      
      #self[:achieved_rank] = result.name if result
      #update(achieved_rank: result.name) if result
    else
      # puts "query for :qce"
      result = AcademicRanking.where("(:points >= qce_min_points AND :points <= qce_max_points) AND (name = :name)", { points: lowest_point, name: chopped_rank_name })
      # result = AcademicRanking.where(":points >= qce_min_points AND :points <= qce_max_points", { points: lowest_point })
      if result
        @new_rank = result.first
        self[:achieved_rank] = result.first.full_name 
      end

      # puts result.first.full_name
      #self[:achieved_rank] = result.name if result
      #update(achieved_rank: result.name) if result
    end

  end

  def get_achieved_ranks

      # query = "last_name like ?"
      # value = "%#{params[:q]}%"
      # @searched_employees = Employee.includes(:rank).where(query, value)


    # "select * from academic_rankings where 116 >= cce_min_points and 116 <= cce_max_points;"
    
  end
end