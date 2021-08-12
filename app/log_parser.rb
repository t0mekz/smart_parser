require_relative "reader/txt_file"

class LogParser
  def initialize(file_path, reader: Reader::TxtFile)
    @collection = {}
    @reader = reader.new(file_path)
    read_file
  end

  def most_viewed
    @collection.map do |k, v|
      { page: k, views: v.size }
    end.sort { |a, b|  b[:views] <=> a[:views] }
  end

  def most_unique_views
    @collection.map do |k, v|
      { page: k, views: v.uniq.size }
    end
  end

  private
  attr_reader :reader

  def read_file
    reader.read do |path, ip|
      ips = @collection[path] || []
      ips.push(ip)
      @collection[path] = ips
    end
  end
end