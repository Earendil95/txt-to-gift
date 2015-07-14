require "./converter.rb"

example = File.open("test_input.txt")
result = File.open("result.txt", "w+")
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