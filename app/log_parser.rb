require_relative "reader/txt_file"
require_relative "models/web_log"

class LogParser
  def initialize(file_path, reader: Reader::TxtFile)
    @collection = []
    @reader = reader.new(file_path)
    read_file
  end

  def most_viewed
    @collection.sort { |a, b| b.views <=> a.views }
  end

  def most_unique_views
    @collection.each(&:refresh_unique_views_counter)
                .sort { |a, b| b.unique_views <=> a.unique_views }
  end

  private
  attr_reader :reader

  def read_file
    temp = {}
    reader.read do |path, ip|
      temp[path] = WebLog.new(path) unless temp[path]
      temp[path].add(ip)
    end
    @collection = temp.values
  end
end