# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_three/problem_one.rb'

RSpec.describe DayThree::ProblemOne do
  describe '#resolve' do
    it 'returns correct result' do
      input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(described_class.new(input).resolve).to eq(109_716)
    end
  end
end
