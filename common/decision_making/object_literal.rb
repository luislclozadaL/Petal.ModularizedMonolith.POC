class ObjectLiteral
  def initialize
    @object = { 'A' => method(:HandleCaseA),
                'B' => method(:HandleCaseB),
                'C' => method(:HandleCaseC) }
  end

  def handle(case_input)
    handler = @object[case_input]
    handler.call()
  end

  private 
  def HandleCaseA
    puts "Handling Case A"
  end

  def HandleCaseB
    puts "Handling Case B"
  end

  def HandleCaseC
    puts "Handling Case C"
  end
end