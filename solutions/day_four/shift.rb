# frozen_string_literal: true

require_relative './shift_action.rb'

module DayFour
  # Class for creating a Shift instance and store actions
  class Shift
    attr_accessor :actions

    def initialize
      @actions = []
    end

    def push_action(schedule_action)
      @actions << schedule_action
    end

    def any_actions?
      @actions.any?
    end
  end
end
