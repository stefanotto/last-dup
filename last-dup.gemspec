# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'last-dup/version'

Gem::Specification.new do |spec|
  spec.name          = "last-dup"
  spec.version       = LastDup::VERSION
  spec.authors       = ["Stefan Otto"]
  spec.email         = ["sotto.de@gmail.com"]
  spec.summary       = %q{Checks a given directory for music you already listened to using your last.fm handle}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/stefanotto/last-dup"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.bindir        = 'bin'
  spec.executables   = ['last-dup']

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "lastfm", "~> 1.23.0"
  spec.add_dependency "id3tag", "~> 0.7.0"
  spec.add_dependency "configliere", "~> 0.4.18"
end
