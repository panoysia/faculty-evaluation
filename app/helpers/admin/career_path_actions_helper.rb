module Admin::CareerPathActionsHelper

  def category_types_for_select
    CareerPathAction::CATEGORY_TYPES.each_with_index.map { |category, index| [category, index] }
  end

  def category_type_to_string(category)
    CareerPathAction::CATEGORY_TYPES[category]
  end

end