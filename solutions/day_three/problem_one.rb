# frozen_string_literal: true

require_relative('./problem.rb')

module DayThree
  # Advent of Code 2018 Day Three Problem One --> https://adventofcode.com/2018/day/3
  class ProblemOne < Problem
    def resolve
      super
      @matrix.count_x
    end
  end
end
