module Columns

  # Public: Utility methods related to regular expressions.
  module Regex

    # Public: Find a table name if it exists.
    #
    # string - The String to scan for a table name.
    #
    # Returns a String table name or nil.
    def self.table_name(string)
      string.match(/create_table\s*"(\w\w*)"/) {|matchdata| matchdata[1] }
    end

  end

end
