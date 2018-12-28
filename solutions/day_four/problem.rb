# frozen_string_literal: true

require 'time'
require_relative './input_matcher.rb'
require_relative './guard.rb'

module DayFour
  # Problem class which contain common logic for ProblemOne and ProblemTwo
  class Problem
    def initialize(input)
      @input_matcher = InputMatcher.new
      @input = input.split(/\n+/).sort_by do |row|
        @input_matcher.match_date(row)
      end
    end

    def resolve
      @input.each do |row|
        @input_matcher.string = row
        match_resolver
      end
    end

    private

    def match_resolver
      if @input_matcher.guard_begin_shift?
        find_or_create_guard
        @current_guard.begin_shift(matched_time)
      end

      if @input_matcher.guard_falls_asleep?
        @current_guard.falls_asleep(matched_time)
      end

      @current_guard.wakes_up(matched_time) if @input_matcher.guard_wakes_up?
    end

    def find_or_create_guard
      @current_guard&.end_shift(matched_time)
      @current_guard = Guard.find_or_new(name: @input_matcher.match[1].to_i)
    end

    def matched_time
      @input_matcher.time
    end
  end
end
