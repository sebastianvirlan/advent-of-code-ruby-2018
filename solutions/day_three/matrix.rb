# frozen_string_literal: true

module DayThree
  # Matrix class which inherits from Array
  class Matrix < Array
    def print
      each { |r| puts r.inspect }
      puts('-' * length * 5)
    end

    def count_x
      flatten.count { |r| r == 'x' }
    end

    def populate(row, col, label)
      return self[row][col] = label if self[row][col] == '.'

      self[row][col] = 'x'
    end
  end
end
