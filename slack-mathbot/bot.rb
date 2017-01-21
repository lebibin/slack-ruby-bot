module SlackMathbot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Math Bot'
      desc 'This bot calculates shit for you.'

      command 'calculate' do
        desc 'Calculates a mathematical expression for you'
      end
    end
  end
end
