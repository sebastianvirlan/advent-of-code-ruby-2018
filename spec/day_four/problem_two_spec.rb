# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_four/problem_two.rb'

RSpec.describe DayFour::ProblemTwo do
  describe '#resolve' do
    it 'returns correctly for' do
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(described_class.new(input).resolve).to eq(136_571)
    end
  end
end
