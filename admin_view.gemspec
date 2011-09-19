# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "admin_view/version"

Gem::Specification.new do |s|
  s.name        = "admin_view"
  s.version     = AdminView::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marko Anastasov", "Darko Fabijan"]
  s.email       = ["devs@renderedtext.com"]
  s.homepage    = "http://github.com/renderedtext/admin_view"
  s.summary     = %q{Rails 3 generator of admin views and controllers for existing models.}
  s.description = %q{Rails 3 generator of admin views and controllers for existing models.}

  s.rubyforge_project = "admin_view"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", ">= 3.0")
  s.add_dependency("rspec-rails", ">= 2.4.0")
  s.add_dependency("meta_search")
  s.add_dependency("kaminari")
end
