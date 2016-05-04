require "./responder"

# Rise
class Rise
  def initialize(name)
    @name = name
    @dictionary = Dictionary.new
    @responders = [
      WhatResponder.new("What", @dictionary),
      RandomResponder.new("Random", @dictionary),
      PatternResponder.new("Pattern", @dictionary)
    ]
  end

  def dialogue(input)
    @responder = @responders[rand(@responders.size)]
    # @responder = PatternResponder.new("Pattern")
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end

  def name
    @name
  end
end
