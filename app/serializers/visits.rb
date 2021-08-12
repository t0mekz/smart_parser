# frozen_string_literal: true

module Serializer
  class Visits
    def initialize(weblog)
      @weblog = weblog
    end

    def serialize
      "#{weblog.page} #{weblog.views} visits"
    end

    private

    attr_reader :weblog
  end
end
