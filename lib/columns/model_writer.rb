module Columns

  # Public: Add schema info to the end of a ruby model.
  class ModelWriter

    def initialize(path: './app/models/')
      @path = path
    end

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
