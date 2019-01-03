# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_five/problem_one.rb'

RSpec.describe DayFive::ProblemOne do
  describe '#resolve' do
    it 'returns correctly for' do
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(described_class.new(input).resolve).to eq(11540)
    end
  end

  describe '#resolve2' do
    it 'returns correctly for' do
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(described_class.new(input).resolve2).to eq(11540)
    end
  end
end
