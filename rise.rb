require "./responder"
require "./dictionary"
require "./emotion"
require "./morph"

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
    # TemplateResponder.new("Random", @dictionary, parts)
  end

  def dialogue(input)
    @emotion.update(input)
    parts = Morph::analyze(input)

    # @responder = @responders[rand(@responders.size)]
    @responder = RandomResponder.new("Random", @dictionary)

    @dictionary.study(input, parts)
    @responder.response(input, @emotion.mood)
  end

  def responder_name
    @responder.name
  end

  def save
    @dictionary.save
  end

  attr_reader :name
end
