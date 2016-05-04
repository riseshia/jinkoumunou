require "./rise"

def prompt(rise)
  "#{rise.name} : #{rise.responder_name} > "
end

puts "Rise System prototype: proto"
rise = Rise.new("proto")
while true
  print("> ")
  input = gets.chomp
  if !input.empty?
    response = rise.dialogue(input)
    puts(prompt(rise) + response)
  else
    rise.save
    break
  end
end
