# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_two/problem_two.rb'

RSpec.describe DayTwo::ProblemTwo do
  describe '#resolve' do
    it 'returns correctly for' do
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expected = 'nvosmkcdtdbfhyxsphzgraljq'

      expect(described_class.new(input).resolve).to eq(expected)
    end
  end
end
