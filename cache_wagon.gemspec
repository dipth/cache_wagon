# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cache_wagon/version"

Gem::Specification.new do |s|
  s.name        = "cache_wagon"
  s.version     = CacheWagon::VERSION
  s.authors     = ["Murui"]
  s.email       = ["thomas@dippel.dk"]
  s.homepage    = "https://github.com/murui/cache_wagon"
  s.summary     = %q{Making your Rails 3 caching experience more fun!}
  s.description = %q{Making your Rails 3 caching experience more fun!}

  s.rubyforge_project = "cache_wagon"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
