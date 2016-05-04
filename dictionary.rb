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

  def study(input, parts)
    study_random(input)
    study_pattern(input, parts)
  end

  def study_random(input)
    if !@random.include?(input)
      @random.push(input)
    end
  end

  def study_pattern(input, parts)
    puts "study_pattern"
    parts.each do |word|
      # next unless Morph::keyword?(part)
      duped = @patterns.find { |item| item.pattern == word }
      if duped
        duped.add_phrase(input)
      else
        @patterns.push(PatternItem.new(word, input))
      end
    end
  end

  def save
    open("dics/random.txt", "w") do |f|
      f.puts(@random)
    end

    open("dics/pattern.txt", "w") do |f|
      @patterns.each { |item| f.puts(item.make_line) }
    end
  end

  attr_reader :random, :patterns
end
