# Inbound Facade allowing external domains to invoke command/query actions from Patients domain
class PatientsInboundFacade
  #################################################################################################################################################################
  # KEY                     # Command  /Query                     # Description                                                                                   #
  #################################################################################################################################################################
  # PatientsQuery1          GetAllPatientsQuery                   List of all patients                                                                            #
  #################################################################################################################################################################
  # PatientsQuery2          GetPatientByIdQuery                   Patient By Id                                                                                   #                       
  #################################################################################################################################################################
  # PatientsCommand1        CreatePatientCommand                  Create a new Patient                                                                            #
  #################################################################################################################################################################

  def initialize
    @dictionary = {'PatientsQuery1' => 'GetAllPatientsQuery', 'PatientsQuery2' => 'GetPatientByIdQuery', 'PatientsCommand1' => 'CreatePatientCommand'}
  end

  def run(key, *params)
    command = @dictionary[key].constantize.new(params)

    return command.run
  end
end