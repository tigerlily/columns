module Columns

  # Extends a content (column names and types) with some meta data.
  class ExtendedContent

    # Public: Get the extended content.
    #
    # content - The String content (from a ModelData object).
    #
    # Returns the String extended content.
    def self.from(content)
      "\n# == Schema Information\n#\n#{content}"
    end
  end
end
