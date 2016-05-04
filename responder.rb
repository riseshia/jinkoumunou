# Responder
class Responder
  def initialize(name, dictionary)
    @name = name
    @dictionary = dictionary
  end

  def response(input, mood = nil)
    ""
  end

  def select_random(array)
    array[rand(array.size)]
  end

  attr_reader :name
end

class WhatResponder < Responder
  def response(input, mood = nil)
    "#{input}は何ですか？"
  end
end

class RandomResponder < Responder
  def initialize(name, dictionary)
    super
    @phrases = []
    open("dics/random.txt") do |f|
      f.each do |line|
        line.chomp!
        @phrases.push(line) unless line.empty?
      end
    end
  end

  def response(_input, mood = nil)
    select_random(@phrases)
  end
end

class PatternResponder < Responder
  def response(input, mood)
    @dictionary.patterns.each do |item|
      m = item.match(input)
      if !m.nil?
        resp = item.choice(mood)
        return resp.gsub(/%match%/, m.to_s)
      end
    end

    select_random(@dictionary.random)
  end
end
