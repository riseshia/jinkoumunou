require "./pattern_item"

# Dictionary
class Dictionary
  def initialize
    @random = []
    open("dics/random.txt") do |f|
      f.each do |line|
        line.chomp!
        @random.push(line) unless line.empty?
      end
    end

    @patterns = []
    open("dics/pattern.txt") do |f|
      f.each do |line|
        pattern, phrases = line.chomp.split("\t")
        next if pattern.nil? || phrases.nil?
        @patterns.push(PatternItem.new(pattern, phrases))
      end
    end
  end

  def study(input)
    if !@random.include?(input)
      @random.push(input)
    end
  end

  def save
    open("dics/random.txt", "w") do |f|
      f.puts(@random)
    end
  end

  attr_reader :random, :patterns
end
