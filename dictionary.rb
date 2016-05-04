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

    @templates = []
    open("dics/template.txt") do |f|
      f.each do |line|
        count, template = line.chomp.split(/\t/)
        next if count.nil? || template.nil?
        count = count.to_i
        @templates[count] = [] unless @templates[count]
        @templates[count].push(template)
      end
    end
  end

  def study(input, parts)
    study_random(input)
    study_pattern(input, parts)
    study_template(parts)
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

  def study_template(parts)
    template = ""
    count = 0
    parts.each do |word, part|
      if Morph::keyword?(part)
        word = "%nown%"
        count += 1
      end
      template += word
    end
    return unless count > 0

    @templates[count] = [] unless @templates[count]
    unless @templates[count].include?(template)
      @templates[count].push(template)
    end
  end

  def save
    open("dics/random.txt", "w") do |f|
      f.puts(@random)
    end

    open("dics/pattern.txt", "w") do |f|
      @patterns.each { |item| f.puts(item.make_line) }
    end

    open("dics/template.txt", "w") do |f|
      @templates.each_with_index do |templates, i|
        next if templates.nil?
        templates.each do |template|
          f.puts(i.to_s + "\t" + template)
        end
      end
    end
  end

  attr_reader :random, :patterns, :templates
end
