# frozen_string_literal: true

require_relative('./problem.rb')

module DayThree
  # Advent of Code 2018 Day Three Problem Two --> https://adventofcode.com/2018/day/3
  class ProblemTwo < Problem
    def resolve
      overlapped = []
      super do |claim_label, current_value|
        overlapped << claim_label
        overlapped << current_value
      end
      (@input.map(&:label) - overlapped).first
    end
  end
end
