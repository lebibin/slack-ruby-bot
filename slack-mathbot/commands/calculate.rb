require 'dentaku'
module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      NAME_COMMAND_REGEX = /\A(.)*(calculate){1}\ /
      NUM_OP_REGEX = /[([\d]+[\^\+\-\*\/]{1}[\d]+)+]/
      OP_REGEX = /[\+\-\*\/]/
      command 'calculate' do |client, data, _match|
        problem = data.text.sub(NAME_COMMAND_REGEX, '').scan(NUM_OP_REGEX).join
        response = if problem[-1] =~ (OP_REGEX)
                     "Error"
                   else
                     ::Dentaku::Calculator.new.evaluate(problem)
                   end
        client.say channel: data.channel, text: response
      end
    end
  end
end
