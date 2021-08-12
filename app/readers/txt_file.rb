# frozen_string_literal: true

module Reader
  class TxtFile
    def initialize(filepath)
      @filepath = filepath
    end

    def read
      File.foreach(filepath) do |line|
        path, ip = line.chomp.split
        yield(path, ip) if block_given?
      end
    end

    private

    attr_reader :filepath
  end
end
