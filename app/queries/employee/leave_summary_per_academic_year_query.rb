class Employee::LeaveSummaryPerAcademicYearQuery

  def initialize(employee)
    @employee = employee
  end
  
  def result
    if Rails.env.production?
      Leave.connection.select_all(sql_for_postgres)
    elsif Rails.env.development?
      Leave.connection.select_all(sql_for_sqlite)
    end
  end


  # private


  attr_reader :employee, :sql_for_postgres, :sql_for_sqlite


  def sql_for_postgres
  <<-SQL
    SELECT
      ay.id,
      ay.start_at,
      ay.end_at,
      15 AS max_leaves,
      COALESCE(lsc.service_credits, 0) AS total_credits,
      COALESCE(leaves.total_days, 0) AS total_days,
      ((15 - COALESCE(leaves.total_days, 0)) +
        COALESCE(lsc.service_credits, 0)) AS remaining
    FROM academic_years ay
    LEFT JOIN (
      SELECT
        academic_year_id,
        SUM(no_of_days) AS service_credits
      FROM leave_service_credits
      WHERE employee_id = #{employee.id}
      GROUP BY academic_year_id
    ) lsc
      ON lsc.academic_year_id = ay.id
    LEFT JOIN (
      SELECT
        academic_year_id,
        SUM(length) AS total_days
      FROM leaves
      WHERE employee_id = #{employee.id}
      GROUP BY academic_year_id
    ) leaves
      ON leaves.academic_year_id = ay.id
    ORDER BY ay.start_at DESC, ay.end_at DESC;
  SQL
  end

  def sql_for_sqlite
  <<-SQL
    SELECT
      ay.id,
      ay.start_at,
      ay.end_at,
      15 AS max_leaves,
      IFNULL(lsc.service_credits, 0) AS total_credits,
      IFNULL(leaves.total_days, 0) AS total_days,
      ((15 - IFNULL(leaves.total_days, 0)) +
        IFNULL(lsc.service_credits, 0)) AS remaining
    FROM academic_years ay
    LEFT JOIN (
      SELECT
        academic_year_id,
        SUM(no_of_days) AS service_credits
      FROM leave_service_credits
      WHERE employee_id = #{employee.id}
      GROUP BY academic_year_id
    ) lsc
      ON lsc.academic_year_id = ay.id
    LEFT JOIN (
      SELECT
        academic_year_id,
        SUM(length) AS total_days
      FROM leaves
      WHERE employee_id = #{employee.id}
      GROUP BY academic_year_id
    ) leaves
      ON leaves.academic_year_id = ay.id
    ORDER BY ay.start_at DESC, ay.end_at DESC;
  SQL
  end

end

=begin
  Interchange the term "relation" and "result" in the method that
  returns data.

  relation  => ActiveRecord::Relation
  result    => ActiveRecord::Result

  Use can also use Model#find_by_sql for custom SQL queries.
  It returns an array of objects from the model where you called
  #find_by_sql.
=end
