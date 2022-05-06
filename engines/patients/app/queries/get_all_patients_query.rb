# Query to get all patients
class GetAllPatientsQuery < CommandQueryHandlerBase
  def initialize(*params)
    # do nothing
    # this query does not require params.
  end

  def run
    patients = Patients::Patient.order('created_at DESC');
    return patients
  end
  
end
