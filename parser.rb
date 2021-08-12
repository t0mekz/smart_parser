#!/usr/bin/ruby

require './app/log_parser'
require './app/writers/standard_output'
require './app/serializers/visits'
require './app/serializers/unique_views'

filepath = './webserver.log'
writer = Writer::StandardOutput.new
log_parser = LogParser.new(ARGV[0] || filepath)

writer.write('===============MOST VIEWS===============')

log_parser.most_viewed.each do |weblog|
  writer.write(Serializer::Visits.new(weblog).serialize)
end

writer.write('===============UNIQUE VIEWS===============')

log_parser.most_unique_views.each do |weblog|
  writer.write(Serializer::UniqueViews.new(weblog).serialize)
end
