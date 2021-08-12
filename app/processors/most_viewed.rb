require_relative '../comparators/desc_views'

module Processor
  class MostViewed
    def initialize(collection)
      @collection = collection
    end

    def process(comparator: Comparator::DescViews)
      collection.sort { |a, b| comparator.compare(a, b) }
    end

    private
    attr_reader :collection
  end
end
