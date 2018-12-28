# frozen_string_literal: true

module DayFour
  # Guard Collection Class Helper
  class GuardCollection < Array
    def find_by_name(name)
      find { |guard| guard.name == name }
    end
  end
end
