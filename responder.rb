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
    @phrases = []
    open('dic/random.txt') do |f|
      f.each do |line|
        line.chomp!
        @phrases.push(line) unless line.empty?
      end
    end
  end

  def select_random(array)
    array[rand(array.size)]
  end

  def response(_input)
    select_random(@phrases)
  end
end
