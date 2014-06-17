module Columns

  # Public: Stores data about a model.
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

    # Public: Get the model's name. For a model `app/models/user.rb`,
    # the model's name will be `user`.
    attr_reader :name

    attr_reader :content

    def initialize(raw_data)
      # Ok, this is really idiot, I know, I know. Must use inflectors in
      # the future.
      @name = raw_data.name[0...-1]

      contents = raw_data.content.split("\n")
      contents.map! {|line| "#  #{line.gsub(/^\s*t\./, '')}\n" }
      @content = contents.join
    end
  end
end
