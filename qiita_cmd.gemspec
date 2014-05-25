# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qiita_cmd/version'

Gem::Specification.new do |spec|
  spec.name          = "qiita_cmd"
  spec.version       = QiitaCmd::VERSION
  spec.authors       = ["Wataru.Kasahara"]
  spec.email         = ["kasahara1019@gmail.com"]
  spec.summary       = %q{The Gem is the command of qiita operation.}
  spec.description   = %q{The Gem is the command of qiita operation.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "thor"

end
