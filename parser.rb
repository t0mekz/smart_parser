#!/usr/bin/ruby

require './app/log_parser'
require './app/writers/standard_output'
require './app/serializers/visits'
require './app/serializers/unique_views'
require './app/processors/most_unique_views'
require './app/processors/most_viewed'

writer = Writer::StandardOutput.new
collection = LogParser.new(ARGV[0] || './webserver.log').parse

writer.write('===============MOST VIEWS===============')

Processor::MostViewed.new(collection).process.each do |weblog|
  writer.write(Serializer::Visits.new(weblog).serialize)
end

writer.write('===============UNIQUE VIEWS===============')

Processor::MostUniqueViews.new(collection).process.each do |weblog|
  writer.write(Serializer::UniqueViews.new(weblog).serialize)
end
