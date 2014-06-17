module Columns

  # Add schema info to the end of a ruby model.
  class ModelWriter

    # Public: Creates a new ModelWriter.
    #
    # path - String relative or absolute path to the models directory.
    #        It's handy to be able to change the path during tests.
    #        Default is './app/models/'.
    def initialize(path: './app/models/')
      @path = path
    end

    # Public: Puts model data and meta data to the end of a model file.
    #
    # model_data - A ModelData, used to deduce the model file and to
    #              grab data.
    #
    # Returns nothing.
    def add_info(model_data)
      @model_data = model_data
      ensure_file_end_with_empty_line
      if File.exists?(model_path)
        File.open(model_path, 'a') do |file|
          file.puts(ExtendedContent.from(@model_data.content))
        end
      end
    end

    private

    def model_path
      File.expand_path(File.join(@path, @model_data.name) + '.rb')
    end

    def ensure_file_end_with_empty_line
      %x( sed -i -e '$a\\' #{model_path} > /dev/null 2>&1 )
    end
  end
end
