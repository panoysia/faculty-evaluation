class AreaInstrument < ActiveRecord::Base
=begin
  4 Areas: Instruction, Research, Extension, Production
    Each area has 4 Instruments:
      * Research, Extension, and Production have the same instruments
      * Instruction has different instruments
=end

  scope :instruction, -> { where(area: 'Instruction') }
  scope :research, -> { where(area: 'Research') }
  scope :extension, -> { where(area: 'Extension') }
  scope :production, -> { where(area: 'Production') }
end