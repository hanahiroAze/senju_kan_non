# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'senju_kan_non/version'

Gem::Specification.new do |spec|
  spec.name          = "senju_kan_non"
  spec.version       = SenjuKanNon::VERSION
  spec.authors       = ["hanahiroAze"]
  spec.email         = ["hiroyuki.hanai@gmail.com"]

  spec.summary       = %q{generate array for pairwise testing.}
  spec.description   = %q{generate some patterns(array) for pairwise testing.(properly speaking, I use covering array method)}
  spec.homepage      = "https://github.com/hanahiroAze/senju_kan_non"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
