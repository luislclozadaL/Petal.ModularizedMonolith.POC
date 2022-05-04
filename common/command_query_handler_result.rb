# POCO class for a result coming from CommandQueryHandler

class CommandQueryHandlerResult

  def initialize(succeded = false, object = nil)
    @succeded = succeded
    @object = object
  end

  def succeded
    @succeded
  end

  def object
    @object
  end
end
