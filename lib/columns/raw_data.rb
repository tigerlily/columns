module Columns

  # Public: A simple object to store raw data about a table.
  class RawData
    attr_reader :name, :content

    def initialize(name, content)
      @name = name
      @content = content
    end

  end
end
