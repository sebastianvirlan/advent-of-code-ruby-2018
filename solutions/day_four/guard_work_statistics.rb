# frozen_string_literal: true

module DayFour
  # Guard Work Statistics
  class GuardWorkStatistics
    RELEVANT_HOUR = 0

    def initialize(guard)
      @guard = guard
    end

    def most_common_minute_asleep
      shifts = pause_minutes_for_shifts

      unless shifts.any?
        return MostCommonMinuteAsleep.new(minute: nil, times: 0)
      end

      minute = shifts.flatten
                     .each_with_object(Hash.new(0)) { |v, hsh| hsh[v] += 1 }
                     .max_by { |_, i| i }
      MostCommonMinuteAsleep.new(minute: minute[0], times: minute[1])
    end

    def total_sleep_minutes
      @guard.shifts.map do |shift|
        in_pause_minutes(shift.actions)
      end.flatten.sum
    end

    private

    def in_pause_minutes(shift_actions)
      filtered_actions = actions_by_relevant_hour(shift_actions)
      filtered_actions.each_cons(2).map do |action, next_action|
        in_pause = action.end? && next_action.start?
        in_pause ? (next_action.time - action.time).to_i : 0
      end
    end

    def every_in_pause_minute(shift_actions)
      filtered_actions = actions_by_relevant_hour(shift_actions)
      filtered_actions.each_cons(2).map do |action, next_action|
        next unless action.end? && next_action.start?

        dates_range = (action.timestamp..(next_action.timestamp - 60))
        dates_range.step(60).map { |date| Time.at(date).to_datetime.minute }
      end.compact
    end

    def pause_minutes_for_shifts
      shifts_minutes = @guard.shifts.map do |shift|
        shift_minutes = every_in_pause_minute(shift.actions)
        shift_minutes if shift_minutes.any?
      end
      shifts_minutes.compact
    end

    def actions_by_relevant_hour(shift_actions)
      actions = shift_actions.select { |w| w.time.hour == RELEVANT_HOUR }

      if actions.any? && actions.first.end?
        actions.unshift(create_start_date_action(actions.first.time))
      end

      actions
    end

    def create_start_date_action(date)
      start_date = Time.new(date.year, date.month, date.day, 0, 0)
      ShiftAction.start(start_date)
    end
  end

  # Response class
  class MostCommonMinuteAsleep
    attr_reader :minute, :times

    def initialize(minute:, times:)
      @minute = minute
      @times  = times
    end
  end
end
