require 'spec_helper'

describe SlackMathbot::Commands::Calculate do
  def app
    SlackMathbot::Bot.instance
  end

  subject { app }

  it 'returns error message if equation is invalid' do
    expect({
      message: "#{SlackRubyBot.config.user} calculate 11 + 123 /",
      channel: 'channel'
    }).to respond_with_slack_message('Error')
  end

  it 'returns correct sum' do
    expect({
      message: "#{SlackRubyBot.config.user} calculate 2+3",
      channel: 'channel'
    }).to respond_with_slack_message('5')
  end

  it 'returns correct difference' do
    expect({
      message: "#{SlackRubyBot.config.user} calculate 2 - 3",
      channel: 'channel'
    }).to respond_with_slack_message('-1')
  end

  it 'returns correct product' do
    expect({
      message: "#{SlackRubyBot.config.user} calculate 11 * 11",
      channel: 'channel'
    }).to respond_with_slack_message('121')
  end

  it 'returns correct quotient' do
    expect({
      message: "#{SlackRubyBot.config.user} calculate 11 / 11",
      channel: 'channel'
    }).to respond_with_slack_message('1')
  end
end
