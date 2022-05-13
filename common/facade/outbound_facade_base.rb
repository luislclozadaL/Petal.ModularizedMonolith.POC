# Base class for Outbound facades

class OutboundFacadeBase

  def get_facade(key)
    get_facade_target(key).constantize.new
  end

  def get_facade_target(key)
    key.gsub("Outbound","Inbound")
  end
end
