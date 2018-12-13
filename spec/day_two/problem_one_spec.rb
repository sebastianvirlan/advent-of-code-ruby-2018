# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_two/problem_one.rb'

RSpec.describe DayTwo::ProblemOne do
  describe '#resolve' do
    it 'returns correctly for' do
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(described_class.new(input).resolve).to eq(5390)
    end
  end
end
