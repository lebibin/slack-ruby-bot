require 'dentaku'
module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      CALCULATE_EXCEPTIONS = [Dentaku::ParseError, Dentaku::TokenizerError]
      ERROR_MESSAGE = "Error"
      match /^.*(calculate|solve) (?<problem>.*)$/ do |client, data, match|
        problem = match[:problem]
        # find instances of 'x' for multiplication and replace with *
        problem.gsub!('x', '*')
        response = begin
                     ::Dentaku::Calculator.new.evaluate(problem)
                   rescue *CALCULATE_EXCEPTIONS
                     ERROR_MESSAGE
                   end
        client.say channel: data.channel, text: response
      end
    end
  end
end
