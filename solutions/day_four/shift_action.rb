# frozen_string_literal: true

module DayFour
  # Class for creating a Shift Action
  class ShiftAction
    attr_accessor :time, :type

    START = 0
    FINISH = 1

    def self.start(time)
      new(time, START)
    end

    def self.end(time)
      new(time, FINISH)
    end

    def initialize(time, type)
      @time = time
      @type = type
    end

    def timestamp
      time.to_time.to_i
    end

    def start?
      type == START
    end

    def end?
      type == FINISH
    end
  end
end
