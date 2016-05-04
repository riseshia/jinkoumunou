require "./responder"

# Rise
class Rise
  def initialize(name)
    @name = name
    @responder = RandomResponder.new("Random")
  end

  def dialogue(input)
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end

  def name
    @name
  end
end
