module Columns

  # Parses a schema.rb file to find table's information.
  #
  # Examples
  #
  #   parser = SchemaParser.new(File.read('schema.rb'))
  #   tables = parser.parse
  #
  #   tables['products']
  #   #=> integer "id"
  #   #=> string  "name"
  #   #=> ...
  #
  #   tables.keys
  #   #=> ['commands', 'products', 'users']
  class SchemaParser

    # Public: Creates a new SchemaParser.
    #
    # file - The schema.rb as a String.
    #
    # Examples
    #
    #   string = File.read(File.expand_path('db/schema.rb'))
    #   parser = SchemaParser.new(string)
    def initialize(file)
      @lines = file.split("\n")
      @hash = {}
      @table_found_state = false
      @content = ''
    end

    # Public: Gets table's names and contents.
    #
    # Returns an Hash who's keys are table's names.
    def parse
      @lines.each {|line| process_line(line) }
      @hash
    end

    private

    def process_line(line)
      if (name = Regex.table_name(line))
        table_found(name)
      elsif @table_found_state
        process_content(line)
      end
    end

    def table_found(name)
      @current_table = name
      @table_found_state = true
    end

    def process_content(line)
      if line =~ /\w*end$/
        @hash[@current_table] = @content
        @table_found_state = false
        @content = ''
      else
        @content << line + "\n"
      end
    end
  end
end
