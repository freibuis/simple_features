# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_features/version"

Gem::Specification.new do |spec|
  spec.name    = "simple_features"
  spec.version = SimpleFeatures::VERSION
  spec.authors = ["Freibuis"]
  spec.email   = ["freibuis@gmail.com"]

  spec.summary     = %q{simple features}
  spec.description = %q{simple features: the cheap ass'ed flag flipper}
  spec.homepage    = "https://github.com/freibuis/simple_features"
  spec.license     = "MIT"

  spec.metadata = {
      "changelog_uri"   => "https://github.com/freibuis/simple_features/blob/master/CHANGELOG",
      "source_code_uri" => "https://github.com/freibuis/simple_features",
  }


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
