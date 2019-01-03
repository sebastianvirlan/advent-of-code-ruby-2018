# frozen_string_literal: true

require_relative 'unit.rb'

module DayFive
  # Problem class which contain common logic for ProblemOne and ProblemTwo
  class Problem
    def initialize(input)
      @input = input.chars
    end

    def react_polymer(polymer)
      offset = 0
      polymer.each_with_index do |_, index|
        next if index < 1

        previous_index  = index - 1 - offset
        current_char    = polymer[index - offset]
        previous_char   = polymer[previous_index]
        units_reacted   = previous_char.upcase.ord == current_char.upcase.ord

        next unless previous_char != current_char && units_reacted

        polymer.slice!(previous_index, 2)
        offset += 2
      end
      offset != 0 ? react_polymer(polymer) : polymer
    end

    def react_polymer2(polymer)
      polymer.each_cons(2) do |unit, next_unit|
        if !unit.dropped && unit != next_unit && same_unit(unit, next_unit)
          unit.dropped = true
          next_unit.dropped = true
        end
      end
      new_polymer = polymer.reject(&:dropped)
      return react_polymer2(new_polymer) if new_polymer.length != polymer.length

      new_polymer
    end

    private

    def same_unit(unit1, unit2)
      unit1.upcase_ord == unit2.upcase_ord
    end
  end
end
