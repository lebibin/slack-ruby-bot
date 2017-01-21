require 'spec_helper'

describe SlackMathbot::Commands::Calculate do
  def app
    SlackMathbot::Bot.instance
  end

  subject { app }

  it 'returns error message if equation is invalid' do
    expect_problem_with_solution('5+1-', described_class::ERROR_MESSAGE)
  end

  context 'Addition' do
    it "returns 5 for 2+3" do
      problem = "2+3"
      solution = "5"
      expect_problem_with_solution(problem, solution)
    end
    it "returns 8 for 5 + 2 +1" do
      problem = "5 + 2  +1"
      solution = "8"
      expect_problem_with_solution(problem, solution)
    end
  end

  context 'Subtraction' do
    it "returns 1 for 4 - 3" do
      problem = "4 - 3"
      solution = "1"
      expect_problem_with_solution(problem, solution)
    end
    it "returns -1 for 3 -  4" do
      problem = "3 -   4"
      solution = "-1"
      expect_problem_with_solution(problem, solution)
    end
  end

  context 'Multiplication' do
    it "returns 10 for 2*5" do
      problem = "2*5"
      solution = "10"
      expect_problem_with_solution(problem, solution)
    end
    it "returns 56 for 7 * 8" do
      problem = "7 * 8"
      solution = "56"
      expect_problem_with_solution(problem, solution)
    end
    it "returns 4 for 4x1" do
      problem = "4x1"
      solution = "4"
      expect_problem_with_solution(problem, solution)
    end
  end

  context 'Division' do
    it "returns 5 for 25/5" do
      problem = "25/5"
      solution = "5"
      expect_problem_with_solution(problem, solution)
    end
    it "returns 2 for 16 / 8" do
      problem = "16 / 8"
      solution = "2"
      expect_problem_with_solution(problem, solution)
    end
    it "returns 1 for 6 ÷ 6" do
      problem = "6 ÷ 6"
      solution = "1"
      expect_problem_with_solution(problem, solution)
    end
  end

  context 'Exponent' do
    it "returns 4 for 2^2" do
      problem = "2^2"
      solution = "4"
      expect_problem_with_solution(problem, solution)
    end
  end

  context 'Combination of operation' do
    it 'returns 27 for 9 + 6 * (8 - 5)' do
      problem = '9 + 6 * (8 - 5)'
      solution = "27"
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 3 for (14 - 5) / (9 - 6)' do
      problem = '(14 -5) / (9 - 6)'
      solution = "3"
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 17 for 5 * 8 + 6 / 6 - 12 * 2' do
      problem = '5 * 8 + 6 / 6 - 12 * 2'
      solution = "17"
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 14 for 3 + 6 x (5 + 4) ÷ 3 - 7' do
      problem = '3 + 6 x (5 + 4) ÷ 3 - 7'
      solution = '14'
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 13 for 9 - 5 ÷ (8 - 3) x 2 + 6' do
      problem = '9 - 5 ÷ (8 - 3) x 2 + 6'
      solution = '13'
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 0 for 150 ÷ (6 + 3 x 8) - 5' do
      problem = '150 ÷ (6 + 3 x 8) - 5'
      solution = '0'
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 40 for 10 ÷ (4 + 6 - 8) × 7 + 5' do
      problem = '10 ÷ (4 + 6 - 8) × 7 + 5'
      solution = '40'
      expect_problem_with_solution(problem, solution)
    end
    it 'returns 5 for 5 × (4 ÷ (10 + 3 - 7 - 2))' do
      problem = '5 × (4 ÷ (10 + 3 - 7 - 2))'
      solution = '5'
      expect_problem_with_solution(problem, solution)
    end
  end

  private
  def expect_problem_with_solution(problem, solution)
    expect({
      message: "#{SlackRubyBot.config.user} calculate #{problem}",
      channel: 'channel'
    }).to respond_with_slack_message(solution)
  end
end
