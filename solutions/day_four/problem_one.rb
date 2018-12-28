# frozen_string_literal: true

require 'time'
require_relative './guard.rb'
require_relative './problem.rb'

module DayFour
  # Advent of Code 2018 Day Four Problem One --> https://adventofcode.com/2018/day/4
  class ProblemOne < Problem
    def resolve
      super
      statistics = Guard.all.each_with_object({}) do |guard, hsh|
        hsh[guard] = GuardWorkStatistics.new(guard).total_sleep_minutes
      end
      guard = statistics.key(statistics.values.max)
      most_sleepy = GuardWorkStatistics.new(guard).most_common_minute_asleep
      most_sleepy.minute * guard.name
    end
  end
end
