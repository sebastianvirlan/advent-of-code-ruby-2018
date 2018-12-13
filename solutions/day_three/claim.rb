# frozen_string_literal: true

module DayThree
  # Claim class which has methods over some calculations
  class Claim
    attr_reader :label, :left, :top, :width, :height

    def initialize(label:, top:, left:, width:, height:)
      @label      = label
      @left       = left
      @top        = top
      @width      = width
      @height     = height
    end

    def width_range
      @left..end_of_width - 1
    end

    def height_range
      @top..end_of_height - 1
    end

    def end_of_width
      @left + @width
    end

    def end_of_height
      @top + @height
    end
  end
end
