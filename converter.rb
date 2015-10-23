class Converter
  attr_accessor :current_question

  def self.convert(example, result, sep: "\n", question_prefix: '\d+\.', option_prefix: '.+?\.', option_correct: '(\+|\*?)')
#    binding.pry 
    loop do
      current_string = example.gets(sep)
      @current_question.write(result) if current_string.nil? && !@current_question.nil?
      break if current_string.nil?
      current_string = current_string.chomp.sub("\xEF\xBB\xBF", "")

      question_regexp = Regexp.new question_prefix + '\s*(.+?)\:?\s*$'
      option_regexp = Regexp.new option_prefix + '\s*(.+?)' + option_correct + '\s*$'

      if current_string =~ question_regexp                                                      # new question
        @current_question.write result unless @current_question.nil?

        @current_question = Question.new

        @current_question.title = $1
      elsif current_string =~ option_regexp                                                     # add option
        @current_question.options.push(body: $1, correct: !($2 == ''))
      elsif current_string =~ /^\s*$/                                                           # empty line
        next
      elsif current_string =~ /\s*(.+?)\:?\s*$/                                                 # multiline question
        @current_question.title = @current_question.title + " #{$1}"
      end
    end
    @current_question = nil
  end
end

class Question
  attr_accessor :title, :options

  def initialize
    @title = ''
    @options = []
  end

  def write(result)
    result.write "#{ escape_gift_chars @title } {\n"

    until @options.empty?
      current_option = @options.shift
      if current_option[:correct]
        result.write '='
      else
        result.write '~'
      end
      result.write "#{ escape_gift_chars current_option[:body] }\n"
    end

    result.write "}\n\n"
  end
end

def escape_gift_chars(str)
  pattern = /[#=~\{\}\/\/:\[\]]|\../
  str.gsub(pattern) { |match| '\\' + match }
end
