# Command for DestroyPatientCommand, (Attributes)

class DestroyPatientCommand < CommandQueryBase
  def initialize(patient_id)
    @patient_id = patient_id
  end

  def patient_id
    @patient_id
  end
end
