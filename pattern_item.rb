# PatternItem
class PatternItem
  SEPARATOR = /\A((-?\d+)##)?(.*)\z/

  def initialize(pattern, phrases)
    SEPARATOR =~ pattern
    @modify, @pattern = $2.to_i, $3

    @phrases = []
    phrases.split("|").each do |phrases|
      SEPARATOR =~ phrases
      @phrases.push({ "need" => $2.to_i, "phrases" => $3 })
    end
  end

  def match(str)
    str.match(@pattern)
  end

  def add_phrase(phrase)
    unless @phrases.find { |p| p["phrase"] == phrase }
      @phrases.push({ "need" => 0, "phrases" => phrase })
    end
  end

  def make_line
    pattern = @modify.to_s + "##" + @pattern
    phrases = @phrases.map { |p| p["need"].to_s + "##" + p["phrases"] }
    pattern + "\t" + phrases.join("|")
  end

  def choice(mood)
    choices = []
    @phrases.each do |p|
      choices.push(p["phrases"]) if suitable?(p["need"], mood)
    end

    choices.empty? ? nil : select_random(choices)
  end

  def suitable?(need, mood)
    if need.zero?
      true
    elsif need > 0
      mood > need
    else
      mood < need
    end
  end

  def select_random(array)
    array[rand(array.size)]
  end


  attr_reader :modify, :pattern, :phrases
end
