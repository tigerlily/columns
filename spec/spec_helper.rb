require 'coco'
require 'fileutils'

require_relative '../lib/columns'
include Columns

def fixtures_path
  File.expand_path(File.dirname(__FILE__) + '/fixtures')# {{{
end# }}}

def schema_file
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/schema.rb')# {{{
  File.read(file_path)
end# }}}

def user_rb_path
  File.expand_path(File.dirname(__FILE__) + '/fixtures/user.rb')# {{{
end# }}}

def user_rb_file
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/user.rb')# {{{
  File.read(file_path)
end# }}}

def user_cleaned_file
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/user_cleaned')# {{{
  File.read(file_path)
end# }}}

def user_filled_file
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/user_filled')# {{{
  File.read(file_path)
end# }}}

def integration_user_filled_file
  file_path = File.expand_path(File.dirname(__FILE__) +# {{{
              '/fixtures/integration/user_filled')
  File.read(file_path)
end# }}}

def remove_user_rb
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/user.rb')# {{{
  FileUtils.rm_f(file_path)
end# }}}

def create_user_rb
  src = File.expand_path(File.dirname(__FILE__) + '/fixtures/user_filled')# {{{
  dest = File.expand_path(File.dirname(__FILE__) + '/fixtures/user.rb')
  FileUtils.cp(src, dest)
end# }}}

def create_clean_user_rb
  src = File.expand_path(File.dirname(__FILE__) + '/fixtures/user_cleaned')# {{{
  dest = File.expand_path(File.dirname(__FILE__) + '/fixtures/user.rb')
  FileUtils.cp(src, dest)
end# }}}
