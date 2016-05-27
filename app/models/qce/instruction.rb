class QCE::Instruction < QCE::Rating
  self.store_full_sti_class = false

  scope :self, -> { where evaluation_context: 'Self' }
  scope :supervisor, -> { where evaluation_context: 'Supervisor' }
  scope :peer, -> { where evaluation_context: 'Peer' }
  scope :student, -> { where evaluation_context: 'Student' }

end