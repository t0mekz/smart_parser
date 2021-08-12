require_relative '../comparators/desc_unique_views'

module Processor
  class MostUniqueViews
    def initialize(collection)
      @collection = collection
    end

    def process(comparator: Comparator::DescUniqueViews)
      collection.each(&:refresh_unique_views_counter)
                .sort { |a, b| comparator.compare(a, b) }
    end

    private
    attr_reader :collection
  end
end
