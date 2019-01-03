# frozen_string_literal: true

require_relative 'problem.rb'

module DayFive
  # Advent of Code 2018 Day Five Problem One --> https://adventofcode.com/2018/day/5
  class ProblemOne < Problem
    def resolve
      react_polymer(@input).length
    end

    def resolve2
      polymer = @input.each_with_index.map do |char, index|
        Unit.register(char, index)
      end
      react_polymer2(polymer).length
    end
  end
end
