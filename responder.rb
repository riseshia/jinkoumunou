# Responder
class Responder
  def initialize(name)
    @name = name
  end

  def response(input)
    ""
  end

  def name
    @name
  end
end

class WhatResponder < Responder
  def response(input)
    "#{input}は何ですか？"
  end
end

class RandomResponder < Responder
  def initialize(name)
    super
    @responses = %w[今日は寒いですね。 チョコ食べたいです。 昨日10円を拾いました。]
  end
  def response(input)
    @responses[rand(@responses.size)]
  end
end
