# Base class for CommandQuery (No Implementation)

class CommandQueryBase
  def get_alias
    raise "alias must be set by child class"
  end
end
