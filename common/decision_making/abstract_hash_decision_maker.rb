class AbstractHashDecisionMaker
  def initialize
    @object = Hash.new
  end

  def load_case(key, block)
    @object[key] = block
  end

  def decide(case_input)
    callback = @object[case_input]
    callback.call
  end
end