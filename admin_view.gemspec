# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "admin_view/version"

Gem::Specification.new do |s|
  s.name        = "admin_view"
  s.version     = AdminView::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["RT"]
  s.email       = ["devs@"]
  s.homepage    = ""
  s.summary     = %q{Admin view}
  s.description = %q{admin view}

  s.rubyforge_project = "admin_view"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
