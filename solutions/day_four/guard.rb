# frozen_string_literal: true

require_relative './guard_collection.rb'
require_relative './shift.rb'
require_relative './shift_action.rb'
require_relative './guard_work_statistics.rb'

module DayFour
  # Class for creating a Guard instance
  class Guard
    STATISTICS = GuardWorkStatistics

    attr_reader :name, :current_shift, :shifts

    def self.all
      @all ||= GuardCollection.new
    end

    def self.find_or_new(name:)
      guard = all.find_by_name(name)
      guard || new(name: name)
    end

    def initialize(name:)
      @name = name
      @shifts = []
      Guard.all << self
    end

    def wakes_up(time)
      shift_action = ShiftAction.start(time)
      @current_shift.push_action(shift_action)
    end

    def falls_asleep(time)
      shift_action = ShiftAction.end(time)
      @current_shift.push_action(shift_action)
    end

    def begin_shift(time)
      new_shift
      shift_action = ShiftAction.start(time)
      @current_shift.push_action(shift_action)
    end

    def end_shift(time)
      shift_action = ShiftAction.end(time)
      @current_shift.push_action(shift_action)
    end

    private

    def new_shift
      @current_shift = Shift.new
      @shifts << @current_shift
    end
  end
end
