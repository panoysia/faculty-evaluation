# == Schema Information
#
# Table name: qce_rating_evaluations
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  score       :integer          default(0)
#  rating_id   :integer          not null
#  rating_type :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_qce_rating_evaluations_on_question_id                (question_id)
#  index_qce_rating_evaluations_on_rating_type_and_rating_id  (rating_type,rating_id)
#

class QCE::RatingEvaluation < ActiveRecord::Base
  self.table_name_prefix = 'qce_'

  belongs_to :question, class_name: 'QCE::Question'
  belongs_to :rating, polymorphic: true

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
