# frozen_string_literal: true

require_relative 'readers/txt_file'
require_relative 'models/web_log'
require_relative 'comparators/desc_views'
require_relative 'comparators/desc_unique_views'
require_relative 'repositories/web_log_repository'

class LogParser
  def initialize(file_path, reader: Reader::TxtFile, repository: WebLogRepository.new)
    @repository = repository
    @reader = reader.new(file_path)
    read_file
  end

  def most_viewed(comparator: Comparator::DescViews)
    repository.all.sort { |a, b| comparator.compare(a, b) }
  end

  def most_unique_views(comparator: Comparator::DescUniqueViews)
    repository.all.each(&:refresh_unique_views_counter)
              .sort { |a, b| comparator.compare(a, b) }
  end

  private

  attr_reader :reader, :repository

  def read_file
    reader.read do |path, ip|
      repository.add(path, ip)
    end
  end
end
