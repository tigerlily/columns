require 'active_support/inflector'

module Columns

  # Stores data about a model.
  #
  # Model name
  # ----------
  # Usually a table is named with a plural, like 'users'. The
  # corresponding model name is in singular, like 'user'.
  #
  # Model content
  # -------------
  # We want a «ready to paste» content.
  #
  # So, for example, if the raw content is:
  #
  #     integer "foo"
  #
  # what we want is something like this:
  #
  #     #  integer "foo"
  class ModelData

    # Public: Get the String model's name. For a model `app/models/user.rb`,
    # the model's name will be `user`.
    attr_reader :name

    # Public: Get a String formatted content.
    attr_reader :content

    # Public: Creates a new ModelData.
    #
    # name    - String name of the table.
    # content - String content (column's names and types) of the table.
    #
    # Examples
    #
    #   tables     = SchemaParser.new(schema).parse
    #   model_data = ModelData.new(*tables.assoc('policies'))
    #   model_data.name #=> 'policy'
    def initialize(name, content)
      @name = name.singularize

      contents = content.split("\n")
      contents.map! {|line| "#  #{line.gsub(/^\s*t\./, '')}\n" }
      @content = contents.join
    end
  end
end
