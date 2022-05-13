# Inbound Facade allowing external domains to invoke command/query actions from Patients domain
class PatientsInboundFacade
  #################################################################################################################################################################
  # KEY                     # Command  /Query                     # Description                                                                                   #
  #################################################################################################################################################################
  # PatientsQuery1          GetAllPatientsQueryHandler            List of all patients                                                                            #
  #################################################################################################################################################################
  # PatientsQuery2          GetPatientByIdQueryHandler            Patient By Id                                                                                   #                       
  #################################################################################################################################################################
  # PatientsCommand1        CreatePatientCommandHandler           Create a new Patient                                                                            #
  #################################################################################################################################################################
  # PatientsCommand2        DestroyPatientCommandHandler          Destroy a Patient                                                                            #
  #################################################################################################################################################################

  def initialize
    @dictionary = { 'PatientsQuery1' => 'GetAllPatientsQueryHandler', 
                    'PatientsQuery2' => 'GetPatientByIdQueryHandler', 
                    'PatientsCommand1' => 'CreatePatientCommandHandler', 
                    'PatientsCommand2' => 'DestroyPatientCommandHandler'}
  end

  def run(key, params)
    command = @dictionary[key].constantize.new(params)

    return command.run
  end
end