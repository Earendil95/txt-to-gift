class Converter
  attr_accessor :current_question

  def self.convert(example, result)
    current_string = example.gets
    while !current_string.nil?
      if current_string =~ /\d+\.\s*(.+?)\:\s*$/
        @current_question = Question.new

        @current_question.title = $1
      elsif current_string =~ /.+?\.\s*(.+?)(\+|\*?)$/
        if @current_question.options == nil
          @current_question.options = Array.new
        end

        @current_question.options.push( body: $1, true: !($2 == '') )
      elsif current_string =~ /^\s*$/
        result.write ":: #{ @current_question.title } {\n"

        while @current_question.options != []
          current_option = @current_question.options.shift
          if current_option[:true]
            result.write '='
          else
            result.write '~'
          end
          result.write "#{ current_option[:body] }\n"
        end

        result.write "}\n\n"
        @current_question = nil
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
end