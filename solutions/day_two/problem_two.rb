# frozen_string_literal: true

module DayTwo
  # Advent of Code 2018 Day Two Problem Two --> https://adventofcode.com/2018/day/2
  class ProblemTwo
    def initialize(input)
      @input = input.split(/\n+/).map(&:chars)
    end

    def resolve
      transposed = @input.permutation(2).to_a.map(&:transpose)
      common_char_list = transposed.map { |el| el.select { |e| e[0] == e[1] } }
      common_char_list.max_by(&:length).transpose.first.join
    end
  end
end
