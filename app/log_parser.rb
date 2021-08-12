# frozen_string_literal: true

require_relative 'readers/txt_file'
require_relative 'repositories/web_log_repository'

class LogParser
  def initialize(file_path, reader: Reader::TxtFile, repository: WebLogRepository.new)
    @repository = repository
    @reader = reader.new(file_path)
  end

  def parse
    reader.read do |path, ip|
      repository.add(path, ip)
    end
    repository.all
  end

  private

  attr_reader :reader, :repository
end
