require "columns/version"
require "columns/table"
require "columns/regex"
require "columns/raw_data"
require "columns/model_data"
require "columns/model_cleaner"
require "columns/model_writer"
require "columns/extended_content"

# Public: Columns annotate your activerecord models from a `schema.rb` file.
# That could be handy when your application don't use Rails.
module Columns

  # Public: Annotate models.
  #
  # schema_dir - String directory (absolute or relative) to find the
  #              `schema.rb` file. Default is `./db/`.
  # models_dir - String directory (absolute or relative) to find the
  #              models. Default is `./app/models/`.
  #
  # Returns nothing.
  #
  # Raises SystemExit if the `schema.rb` doesn't exist.
  def self.execute(schema_dir: './db/', models_dir: './app/models/')
    application = Application.new(schema_dir, models_dir)
    application.execute
  end

  private

  # The tool chain.
  class Application

    # Creates a new Application.
    #
    # See Columns.execute for arguments.
    def initialize(schema_dir, models_dir)
      @models_dir = models_dir
      schema_path = File.expand_path(File.join(schema_dir,'schema.rb'))

      unless File.exists?(schema_path)
        puts "COLUMNS ERROR : #{schema_path} doesn't exist!"
        exit 1
      end
      table = Table.new(File.read(schema_path))

      raw_data_objects = []
      table.names.each do |name|
        raw_data_objects << RawData.new(name, table.content_for(name))
      end

      @model_data_objects = raw_data_objects.map do |object|
        ModelData.new(object)
      end
    end

    # Cleans then writes models.
    #
    # Returns nothing.
    def execute
      writer = ModelWriter.new(path: @models_dir)
      @model_data_objects.each do |object|
        path = File.expand_path(File.join(@models_dir, object.name) + '.rb')
        ModelCleaner.clean(path)
        writer.add_info(object)
      end
    end

  end
end
