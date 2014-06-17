module Columns

  # A simple object to store raw data about a table.
  class RawData

    # Public: Get the String table's name.
    attr_reader :name

    # Public: Get the String table's content, i.e column's names and
    #   types.
    attr_reader :content

    # Public: Creates a new RawData.
    #
    # name    - A String table's name.
    # content - A String content related to the table, directly grabbed
    #           from a `schema.rb`.
    def initialize(name, content)
      @name = name
      @content = content
    end

  end
end
