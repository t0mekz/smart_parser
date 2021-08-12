# frozen_string_literal: true

module Comparator
  class DescViews
    def self.compare(a, b)
      b.views <=> a.views
    end
  end
end
