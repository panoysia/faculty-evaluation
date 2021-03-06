# == Schema Information
#
# Table name: qce_questions
#
#  id          :integer          not null, primary key
#  question    :string           not null
#  sequence    :integer          not null
#  rating_type :string           not null
#  instrument  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QCE::Question < ActiveRecord::Base
  self.table_name_prefix = 'qce_'

  #has_many :scores, class_name: 'QCE::Question'
  
  scope :instruction, -> { where(rating_type: 'Instruction') }  
  scope :research, -> { where(rating_type: 'Research') }
  scope :production, -> { where(rating_type: 'Production') }
  scope :extension, -> (instrument = '') { where(rating_type: 'Extension') }
  scope :latest, -> (size = 8) { order(start_at: :desc, end_at: :desc).limit(size) }  


  scope :clientele, -> { where(instrument: 'Clientele Satisfaction') }
  scope :leadership, -> { where(instrument: 'Leadership') }
  scope :partnership, -> { where(instrument: 'Partnership Development') }
  scope :community, -> { where(instrument: 'Community Responsibility') }

  #   scope :latest, -> (size = 8) { order(filed_at: :desc).limit(size) }


  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end  
