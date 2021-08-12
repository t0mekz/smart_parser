require './app/log_parser'
require './app/writer/standard_output'
require './app/serializer/visits'
require './app/serializer/unique_views'

filepath = "./webserver.log"
writer = Writer::StandardOutput.new
log_parser = LogParser.new(filepath)
writer.write("===============MOST VIEWS===============")
log_parser.most_viewed.each do |weblog|
  writer.write(Serializer::Visits.new(weblog).serialize)
end
writer.write("===============UNIQUE VIEWS===============")
log_parser.most_unique_views.each do |weblog|
  writer.write(Serializer::UniqueViews.new(weblog).serialize)
end