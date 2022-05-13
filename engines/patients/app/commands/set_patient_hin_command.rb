# Command for Setting hin value to patient, (Attributes)

class SetPatientHinCommand < CommandQueryBase
  def initialize(patient_id, hin)
    @patient_id = patient_id
    @hin = hin
  end

  def patient_id
    @patient_id
  end

  def hin
    @hin
  end
end
