# frozen_string_literal: true

module DayTwo
  # Advent of Code 2018 Day Two Problem One --> https://adventofcode.com/2018/day/2
  class ProblemOne
    def initialize(input)
      @input = input.split(/\n+/).map { |row| row.split('') }
    end

    def resolve
      twos_count = 0
      threes_count = 0

      @input.each do |row|
        id = row.group_by { |w| w }.values.map(&:length)
        twos_count    += 1 if id.include?(2)
        threes_count  += 1 if id.include?(3)
      end

      twos_count * threes_count
    end
  end
end

# id = row.group_by { |w| w }.values
# twos = id.select { |group| group.length == 2 }
# twos_count += 1 if twos.any?
# threes = id.select { |group| group.length == 3 }
# threes_count += 1 if threes.any?

# id = row.group_by { |w| w }.values.map(&:length)
# twos_count    += 1 if id.include?(2)
# threes_count  += 1 if id.include?(3)
