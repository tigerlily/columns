module Columns

  # This class is responsible of removing a possible schema info
  # from a ruby model file. Note that it isn't any attempt to actually
  # check if we really deals with a model.
  class ModelCleaner

    # Public: Removes schema info.
    #
    # file_path - An absolute String file name.
    #
    # Returns nothing.
    def self.clean(file_path)
      %x( sed -i -e '/# == Schema Info/,$d' #{file_path}  > /dev/null 2>&1 )
    end
  end
end
