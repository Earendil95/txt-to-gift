class Converter
  attr_accessor :current_question

  def self.convert(example, result)
    current_string = example.gets
    while !current_string.nil?
      if current_string =~ /\d+\.\s*(.+?)\:?\s*$/
        @current_question = Question.new

        @current_question.title = $1
      elsif current_string =~ /.+?\.\s*(.+?)(\+|\*?)$/
        @current_question.options.push( body: $1, true: !($2 == '') )
      elsif current_string =~ /^\s*$/
        if @current_question.nil?
          next
        end

        result.write "#{ escape_gift_chars @current_question.title } {\n"

        while @current_question.options != []
          current_option = @current_question.options.shift
          if current_option[:true]
            result.write '='
          else
            result.write '~'
          end
          result.write "#{ escape_gift_chars current_option[:body] }\n"
        end

        result.write "}\n\n"
        @current_question = nil
      elsif current_string =~ /(.+?)\:?$/
        @current_question.title = @current_question.title + " #{$1}"
      end

      current_string = example.gets
      if current_string.nil? && !@current_question.nil?
        current_string = ''
      end
    end
  end
end

class Question
  attr_accessor :title, :options

  def initialize
    @title = ''
    @options = []
  end
end

def escape_gift_chars(str)
  pattern = /[#=~\{\}\/\/:\[\]]|\../
  str.gsub(pattern) { |match| "\\" + match }
end