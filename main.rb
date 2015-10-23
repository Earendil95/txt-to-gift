require './converter.rb'

puts "#{ ARGV }"

if ARGV[0].nil?
  example = File.open('test_input.txt')
else
  example = File.open(ARGV[0])
end

if ARGV[1].nil?
  result = File.open('result.txt', 'w')
else
  result = File.open(ARGV[1], 'w')
end

if !ARGV[2].nil? && !ARGV[3].nil? && !ARGV[4].nil?
  Converter.convert(example, result, question_prefix: ARGV[2], option_prefix: ARGV[3], option_correct: ARGV[4])
else
  Converter.convert(example, result)
end

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
