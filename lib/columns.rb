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

  def self.execute(schema_dir: './db/', models_dir: './app/models/')
    schema_path = File.expand_path(File.join(schema_dir,'schema.rb'))

    table = Table.new(File.read(schema_path))

    # create RawData for each tables
    raw_data_objects = []
    table.names.each do |name|
      raw_data_objects << RawData.new(name, table.content_for(name))
    end

    # create ModelData from each RawData
    model_data_objects = raw_data_objects.map do |o|
      ModelData.new(o)
    end

    # clean all models using ModelCleaner
    # write all models using ModelData
    writer = ModelWriter.new(path: models_dir)
    model_data_objects.each do |o|
      path = File.expand_path(File.join(models_dir, o.name) + '.rb')
      ModelCleaner.clean(path)
      writer.add_info(o)
    end
  end
end
