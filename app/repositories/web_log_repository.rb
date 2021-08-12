require_relative '../models/web_log'

class WebLogRepository
  def initialize
    @collection = {}
  end

  def get_by_pathname(pathname)
    collection[pathname]
  end

  def add(path, ip)
    collection[path] = WebLog.new(path) unless get_by_pathname(path)
    collection[path].add(ip)
  end

  def all
    collection.values
  end

  private
  attr_reader :collection
end
