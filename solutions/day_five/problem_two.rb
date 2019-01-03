# frozen_string_literal: true

require_relative 'unit.rb'
require_relative 'problem.rb'

module DayFive
  # Advent of Code 2018 Day Five Problem Two --> https://adventofcode.com/2018/day/5
  class ProblemTwo < Problem
    def resolve
      polymer_lengths = unique_units.map do |unique_unit|
        polymer = filter_polymer_by(unique_unit)
        react_polymer(polymer).length
      end
      polymer_lengths.min
    end

    def resolve2
      polymer_lengths = unique_units.map do |unique_unit|
        filtered_polymer = filter_polymer_by(unique_unit)
        polymer = filtered_polymer.each_with_index.map do |unit, index|
          Unit.register(unit, index)
        end
        react_polymer2(polymer).length
      end
      polymer_lengths.min
    end

    def unique_units
      @input.map(&:downcase).uniq
    end

    def filter_polymer_by(unit_param)
      @input.reject { |unit| [unit_param, unit_param.upcase].include?(unit) }
    end
  end
end
