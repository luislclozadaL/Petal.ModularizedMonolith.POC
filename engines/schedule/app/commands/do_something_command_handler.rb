# Command for testing purposes
class DoSomethingCommandHandler < CommandQueryHandlerBase
  
  def initialize(*params)
    id = params[0]['id']
    @attributes = DoSomethingCommand.new(id,id)

    raise 'availability id is required' unless @attributes.availability_id
  end

  def run
    # Try to get a dataset and try to query it.
    patients_facade = PatientsOutboundFacade.new
    all_patients = patients_facade.get_all_patients()

    logger.warn all_patients.length.to_s + " patients found"


    filtered_items = all_patients.where("id > ?", 10) 
    logger.warn "#{ filtered_items.length.to_s } filtered items"

    item = filtered_items.find_by(id:15)
    
    logger.warn item.first_name
    logger.warn  "did it work?"

    # try to get specific information 
    patients_facade = PatientsOutboundFacade.new
    patient = patients_facade.get_patient_by_id(@attributes.patient_id)

    #do something with that

    return "Patient found, information has been retrieved from outside domain" if patient
    return "Patient not found but information has been retrieved from outisde domain"
  end

  def logger
    PocLogger.new
  end
end