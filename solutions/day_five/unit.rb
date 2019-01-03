# frozen_string_literal: true

module DayFive
  # Unit class that keeps track of a dropped unit
  class Unit < String
    attr_accessor :dropped, :index

    def initialize(str)
      super
      @dropped = false
    end

    def self.register(str, index)
      letter = new(str)
      letter.index = index
      letter
    end

    def upcase_ord
      downcase.ord - 32
    end
  end
end