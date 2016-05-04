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
        @patterns.push({ "pattern" => pattern, "phrases" => phrases })
      end
    end
  end

  attr_reader :random, :patterns
end