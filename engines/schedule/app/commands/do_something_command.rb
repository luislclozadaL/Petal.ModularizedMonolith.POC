# Command for testing purposes
class DoSomethingCommand < CommandQueryHandlerBase
  
  def initialize(*params)
    id = params[0]['id']
    @attributes = DoSomething.new(id,id)

    raise 'availability id is required' unless @attributes.availability_id
  end

  def run
    # Try to get a dataset and try to query it.
    patients_facade = PatientsOutboundFacade.new
    all_patients = patients_facade.get_all_patients()

    puts all_patients.length.to_s + " patients found"

    item = all_patients.find_by(id:10)

    puts item.first_name
    puts "did it work?"

    # try to get specific information 
    patients_facade = PatientsOutboundFacade.new
    patient = patients_facade.get_patient_by_id(@attributes.patient_id)

    #do something with that

    return "Patient found, information has been retrieved from outside domain" if patient
    return "Patient not found but information has been retrieved from outisde domain"
  end
end