# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sync_fog/version'

Gem::Specification.new do |spec|
  spec.name          = "sync_fog"
  spec.version       = SyncFog::VERSION
  spec.authors       = ["Benjamin Müller"]
  spec.email         = ["elchbenny@googlemail.com"]

  spec.summary       = %q{Uploads the precompiled assets in public/assets to any fog storage.}
  spec.description   = %q{Uploads the precompiled assets in public/assets to any fog storage.}
  spec.homepage      = "http://github.com/ben-ole"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.10', '>= 1.10.6'
  spec.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  spec.add_development_dependency 'minitest', '~> 5.8', '>= 5.8.2'

  spec.add_runtime_dependency 'fog', '~> 1.35'
end
