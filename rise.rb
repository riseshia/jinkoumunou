require "./responder"
require "./emotion"

# Rise
class Rise
  def initialize(name)
    @name = name
    @dictionary = Dictionary.new
    @emotion = Emotion.new(@dictionary)

    @responders = [
      WhatResponder.new("What", @dictionary),
      RandomResponder.new("Random", @dictionary),
      PatternResponder.new("Pattern", @dictionary)
    ]
  end

  def dialogue(input)
    @emotion.update(input)
    # @responder = @responders[rand(@responders.size)]
    @responder = PatternResponder.new("Pattern", @dictionary)
    @responder.response(input, @emotion.mood)
  end

  def responder_name
    @responder.name
  end

  attr_reader :name
end
