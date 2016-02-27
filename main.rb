require './converter.rb'

if ARGV[0].nil?
  example = File.open('test_input.txt')
else
  example = File.open(ARGV.shift)
end

if ARGV[1].nil?
  result = File.open('result.txt', 'w')
else
  result = File.open(ARGV.shift, 'w')
end

options = {}
options[:question_prefix] = ARGV.shift unless ARGV.empty?
options[:option_prefix] = ARGV.shift unless ARGV.empty?
options[:option_correct] = ARGV.shift unless ARGV.empty?
options[:answers] = ARGV.shift unless ARGV.empty?
Converter.convert(example, result, options)
example.close

# unless ARGV[2].nil? || ARGV[3].nil? || ARGV[4].nil?
#   Converter.convert(example, result, question_prefix: ARGV[2], option_prefix: ARGV[3], option_correct: ARGV[4])
# else
#   Converter.convert(example, result)
# end
