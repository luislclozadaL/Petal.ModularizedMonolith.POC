class AbstractConditionalSetDecisionMaker
  def initialize
    @conditions = Array.new
    @callbacks = Array.new
  end

  def load_condition(condition,callback)
    @conditions.push(condition)
    @callbacks.push(callback)
  end

  def decide()
    reached = false
    result = nil
    
    @conditions.each_with_index do |condition, index| 
      if condition.call()
        reached = true
        result = @callbacks[index].call()
        break
      end
    end
    return [reached, result]
  end
end