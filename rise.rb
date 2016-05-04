require "./responder"

# Rise
class Rise
  def initialize(name)
    @name = name
    @responders = [
      WhatResponder.new("What"),
      RandomResponder.new("Random")
    ]
  end

  def dialogue(input)
    @responder = @responders[rand(@responders.size)]
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end

  def name
    @name
  end
end
