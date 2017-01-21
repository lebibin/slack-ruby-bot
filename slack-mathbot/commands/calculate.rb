module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      NUM_OP_REGEX = /[([\d]+[\+\-\*\/]{1}[\d]+)+]/
      OP_REGEX = /[\+\-\*\/]/

      command 'calculate' do |client, data, _match|
        problem = data.text.scan(NUM_OP_REGEX).join
        response = if problem[-1] =~ (OP_REGEX)
                     "Error"
                   else
                     eval(problem)
                   end
        client.say channel: data.channel, text: response
      end
    end
  end
end
