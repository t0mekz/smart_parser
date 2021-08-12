class LogParser
  def initialize(file_path)
    @collection = {}
    read_file(file_path)
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

  def read_file(file_path)
    File.foreach(file_path) do |line|
      path, ip = line.chomp.split
      ips = @collection[path] || []
      ips.push(ip)
      @collection[path] = ips
    end
  end
end