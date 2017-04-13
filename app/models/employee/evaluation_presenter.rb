require "delegate"

class Employee::EvaluationPresenter < SimpleDelegator
  QCES_PER_EVALUATION = 6

  delegate :id, :full_name,
            to: :employee,
            allow_nil: true, prefix: true

  delegate :id, :name, :academic_years,
            to: :nbc,
            allow_nil: true, prefix: true

  attr_reader :cce_record


  def initialize(evaluation)
    super(evaluation)
    @evaluation = evaluation
    # @cce_record = Employee::RecordedCCERecord.new(employee, nbc_id)
  end

  def academic_years_covered
    criteria = { start_at: :asc, end_at: :asc }
    nbc_academic_years.order(criteria).map { |ay| ay.coverage_in_years }
  end

  def qces
    @qces ||= summarized_qces
  end

  def qces_average_weighted_score_for_instruction
    scores = qces.map(&:weighted_score_for_instruction)
    scores.sum / qces.size.to_f
  end

  def qces_average_weighted_score_for_support_area(area)
    scores = qces.
              select { |qce| qce.support_area == area.to_s.capitalize }.
              map { |qce| qce.weighted_score_for_support_area(area) }

    return nil if scores.empty?
    scores.sum / scores.size.to_f

    # qces.sum(:weighted_score_for_support_area) /
    #   QCES_PER_EVALUATION.to_f
    # total / support_area_count_for(area).to_f
  end

  def qces_average_weighted_total_score
    # @qce_score ||= compute_average_of_weighted_total_score
    @_qce_score ||= compute_average_of_weighted_total_score
  end

  def support_area_count_for(area)
    @support_areas_count ||= count_support_areas
    @support_areas_count[area]
  end

  def chosen_score
    cce_score <= qce_score ? cce_score : qce_score
  end

  def evaluated?
    persisted?
  end

  def status
    if evaluated?
      "Evaluated and recorded"
    else
      "Not yet initiated"
    end
  end

  def to_s
    "Evaluation of #{employee_full_name} for NBC #{nbc_name}"
  end


  private


  attr_reader :evaluation


  def summarized_qces
    evaluation.qces.map { |qce| Evaluation::QCESummarizer.new(qce) }
  end

  def count_support_areas
    areas_count = { research: 0, extension: 0, production: 0}
    areas = qces.group_by { |qce| qce.support_area }

    areas.keys.each do |key|
      areas_count[key.downcase.to_sym] = areas[key].count
    end

    areas_count
  end

  def compute_average_of_weighted_total_score
    scores = qces.map(&:weighted_total_score)
    scores.sum / scores.size.to_f
  end

end
