class DoSomethingCommand < CommandQueryBase

  def initialize(availability_id, patient_id)
    @availability_id = availability_id
    @patient_id = patient_id
  end

  def availability_id
    @availability_id
  end

  def patient_id
    @patient_id
  end
end