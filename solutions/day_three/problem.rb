# frozen_string_literal: true

require_relative('./claim.rb')
require_relative('./matrix.rb')

module DayThree
  # Problem class which contain common logic for ProblemOne and ProblemTwo
  class Problem
    def initialize(input)
      @input = input.split(/\n+/).map do |r|
        match = r.match(/#+(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)/)
                 .to_a.drop(1).map(&:to_i)
        Claim.new(
          label: match[0],
          left: match[1], top: match[2],
          width: match[3], height: match[4]
        )
      end
      @matrix = build_matrix_array
    end

    def build_matrix_array
      Matrix.new(matrix_height) { Array.new(matrix_width, '.') }
    end

    def resolve
      @input.each do |claim|
        claim.height_range.each do |row|
          claim.width_range.each do |col|
            current_value = @matrix[row][col]
            new_value     = @matrix.populate(row, col, claim.label.to_s)
            next unless new_value == 'x'

            yield(claim.label, current_value.to_i) if block_given?
          end
        end
      end
    end

    protected

    def matrix_height
      @input.map(&:end_of_height).max
    end

    def matrix_width
      @input.map(&:end_of_width).max
    end
  end
end
