# frozen_string_literal: true

require_relative 'readers/txt_file'
require_relative 'models/web_log'
require_relative 'comparators/desc_views'
require_relative 'comparators/desc_unique_views'

class LogParser
  def initialize(file_path, reader: Reader::TxtFile)
    @collection = []
    @reader = reader.new(file_path)
    read_file
  end

  def most_viewed(comparator: Comparator::DescViews)
    collection.sort { |a, b| comparator.compare(a, b) }
  end

  def most_unique_views(comparator: Comparator::DescUniqueViews)
    collection.each(&:refresh_unique_views_counter)
              .sort { |a, b| comparator.compare(a, b) }
  end

  private

  attr_reader :reader, :collection

  def read_file
    temp = {}
    reader.read do |path, ip|
      temp[path] = WebLog.new(path) unless temp[path]
      temp[path].add(ip)
    end
    @collection = temp.values
  end
end
