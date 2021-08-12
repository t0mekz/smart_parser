# frozen_string_literal: true

module Serializer
  class UniqueViews
    def initialize(weblog)
      @weblog = weblog
    end

    def serialize
      "#{weblog.page} #{weblog.unique_views} unique views"
    end

    private

    attr_reader :weblog
  end
end
