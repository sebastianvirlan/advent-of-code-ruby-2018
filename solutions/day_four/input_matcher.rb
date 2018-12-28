# frozen_string_literal: true

require 'time'
require_relative './guard.rb'

module DayFour
  # Class for parsing the problem input
  class InputMatcher
    attr_accessor :string
    attr_reader :match

    def initialize
      @string = ''
      @match = []
    end

    def match_date(string)
      Time.parse(string.match(regex_date).to_a[1])
    end

    def guard_begin_shift?
      match?(regex_guard_begin_shift)
    end

    def guard_falls_asleep?
      match?(regex_guard_falls_asleep)
    end

    def guard_wakes_up?
      match?(regex_guard_wakes_up)
    end

    def time
      Time.parse(@match[0])
    end

    private

    def match?(regex)
      (@match = @string.match(regex).to_a.drop(1)) && @match.any?
    end

    def regex_date
      /\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2})\]/
    end

    def regex_guard_begin_shift
      /\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2})\] Guard #(\d+) begins shift/
    end

    def regex_guard_falls_asleep
      /\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2})\] falls asleep/
    end

    def regex_guard_wakes_up
      /\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2})\] wakes up/
    end
  end
end
