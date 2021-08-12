# frozen_string_literal: true

module Writer
  class StandardOutput
    def write(serialized_text)
      p serialized_text
    end
  end
end
