# Command for CreatePatientCommand, (Attributes)

class CreatePatient < CommandQueryBase
  def initialize(first_name, last_name, hin, active=true)
    @first_name = first_name
    @last_name = last_name
    @hin = hin
    @active = active
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def hin
    @hin
  end

  def active
    @active
  end
end
