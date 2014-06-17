module Columns

  # Represents data for the tables found in schema.
  class Table

    # Public: Find the table names.
    #
    # Returns an Array of String.
    attr_reader :names

    # Public: Creates a new Table.
    #
    # schema - The db/schema.rb as a String.
    def initialize(schema)
      @schema_lines = schema.split("\n")
      @names = @schema_lines.map {|line| Regex.table_name(line) }.compact
    end

    # Public: Get the column names and types for a given table.
    #
    # name - The String name of the desired table.
    #
    # Returns a String with the raw content of the given table section
    #   from the schema file.
    #
    # TODO Sure it's better to parse the schema only once in #initialize.
    def content_for(name)
      found = false
      result = ''
      @schema_lines.each do |line|
        if Regex.table_name(line) == name
          found = true
          next
        end
        if found
          break if line =~ /\w*end$/
          result << line + "\n"
        end
      end
      result
    end
  end

end
