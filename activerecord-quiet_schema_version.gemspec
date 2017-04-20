# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/quiet_schema_version/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-quiet_schema_version"
  spec.version       = Activerecord::QuietSchemaVersion::VERSION
  spec.authors       = ["Takafumi ONAKA"]
  spec.email         = ["takafumi.onaka@gmail.com"]

  spec.summary       = "Turns off Rails DB schema version."
  spec.description   = "Turns off Rails DB schema version."
  spec.homepage      = "https://github.com/onk/activerecord-quiet_schema_version"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
