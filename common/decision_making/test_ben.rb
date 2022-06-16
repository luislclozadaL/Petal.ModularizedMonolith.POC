class TestBen
  def do_test
    letter = 'A'
    number = 1
    test = AbstractConditionalSetDecisionMaker.new
    test.load_condition( proc { letter == 'B' && number == 2 }, proc { puts 'B1' })
    test.load_condition( proc { letter == 'B' && number == 1 }, proc { puts 'B2' })
    test.load_condition( proc { letter == 'A' && number == 2 }, proc { puts 'A2' })
    test.load_condition( proc { letter == 'A' && number == 1 }, proc { puts 'A2' })

    # if (letter == 'B')
    #   if (number == 1)

    #   else

    #   end
    # elsif letter == 'A'
    #   if (number == 1)

    #   else

    #   end
    # end

    test.decide()
  end
end