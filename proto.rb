class Responder
  def initialize(name)
    @name = name
  end

  def response(input)
    "#{input}は何ですか？"
  end

  def name
    @name
  end
end

class Rise
  def initialize(name)
    @name = name
    @responder = Responder.new("What")
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

def prompt(rise)
  "#{rise.name} : #{rise.responder_name} > "
end

puts "Rise System prototype: proto"
proto = Rise.new("proto")
while true
  print("> ")
  input = gets.chomp
  break if input.empty?

  response = proto.dialogue(input)
  puts(prompt(proto) + response)
end
