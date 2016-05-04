require "./rise"

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
