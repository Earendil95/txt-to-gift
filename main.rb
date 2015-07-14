require "./converter.rb"

if ARGV[0].nil?
  example = File.open("test_input.txt")
else
  example = File.open(ARGV[0])
end

if ARGV[1].nil?
  result = File.open("result.txt", "w+")
else
  result = File.open(ARGV[1], "w")
end

Converter.convert(example, result)

# input = File.open("test_input.txt")
# str = input.gets
# while str != nil
#   puts str
#   if str =~ /\d+\.\s*(.+?)\:\s*$/
#     puts $1
#   elsif str =~ /.+?\.\s*(.+?)([\+|\*])?$/
#     puts $1
#     puts $2
#   elsif str =~ /^\s*$/
#     puts "new question"
#   end
#   str = input.gets
# end