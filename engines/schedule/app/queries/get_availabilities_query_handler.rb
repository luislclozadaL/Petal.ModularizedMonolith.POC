class GetAvailabilitiesQueryHandler < CommandQueryHandlerBase
  def initialize(*params)
    # no params required
  end

  def run
    return Schedule::Availability.order('Created_at DESC');
  end
end 