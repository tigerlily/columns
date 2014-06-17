lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'columns/version'

Gem::Specification.new do |spec|
  spec.name          = "columns"
  spec.version       = Columns::VERSION
  spec.authors       = ["lkdjiin"]
  spec.email         = ["xavier.nayrac@gmail.com"]
  spec.summary       = %q{Annotates activerecord models using `db/schema.rb`.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ['>=2.0.0', '<2.2.0']

  spec.add_development_dependency "bundler", "~> 1.6.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~>3.0.0'
  spec.add_development_dependency "reek", '~>1.3.7'
  spec.add_development_dependency "coco"

  spec.requirements << 'sed'
end
