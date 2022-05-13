# Command Handler to create a new Patient, Returns an object type CommandQueryHandlerResult
class CreatePatientCommandHandler < CommandQueryHandlerBase

  def initialize(*params)
    @attributes = CreatePatientCommand.new(params[0]['first_name'],params[0]['last_name'], params[0]['hin'],params[0]['active'])

    raise 'Patient First Name is required' unless @attributes.first_name
    raise 'Patient Last Name is required' unless @attributes.last_name
    raise 'Patient Hin is required' unless @attributes.hin
  end

  def run
    patient = ::Patients::Patient.new(first_name:@attributes.first_name, last_name:@attributes.last_name, hin:@attributes.hin, active:@attributes.hin)

    if patient.save
      return CommandQueryHandlerResult.new(true, patient)
    else
      return CommandQueryHandlerResult.new(false,patient.errors)
    end
  end

  def get_messages
    [CreatePatientMessage.new(first_name:@attributes.first_name, last_name:@attributes.last_name, hin:@attributes.hin)]
  end
end
