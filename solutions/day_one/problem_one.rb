# frozen_string_literal: true

module DayOne
  # Advent of Code 2018 Day One Problem One --> https://adventofcode.com/2018/day/1
  class ProblemOne
    def initialize(input)
      @input = input.split(/\n+/).map(&:to_i)
    end

    def resolve
      @input.sum
    end
  end
end
