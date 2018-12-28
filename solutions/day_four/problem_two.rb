# frozen_string_literal: true

require 'time'
require_relative './guard.rb'
require_relative './problem.rb'

module DayFour
  # Advent of Code 2018 Day Four Problem Two --> https://adventofcode.com/2018/day/4
  class ProblemTwo < Problem
    def resolve
      super
      statistics = Guard.all.each_with_object({}) do |guard, hsh|
        hsh[guard] = GuardWorkStatistics.new(guard).most_common_minute_asleep
      end
      guard = statistics.key(statistics.values.max_by(&:times))
      statistics[guard].minute * guard.name
    end
  end
end
