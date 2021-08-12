# frozen_string_literal: true

module Comparator
  class DescUniqueViews
    def self.compare(a, b)
      b.unique_views <=> a.unique_views
    end
  end
end
