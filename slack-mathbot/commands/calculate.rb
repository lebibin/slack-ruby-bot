require 'dentaku'
module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      CALCULATE_EXCEPTIONS = [Dentaku::ParseError, Dentaku::TokenizerError]
      ERROR_MESSAGE = "Error"
      match /^.*(calculate|solve) (?<problem>.*)$/ do |client, data, match|
        response = begin
                     ::Dentaku::Calculator.new.evaluate(match[:problem])
                   rescue *CALCULATE_EXCEPTIONS
                     ERROR_MESSAGE
                   end
        client.say channel: data.channel, text: response
      end
    end
  end
end
