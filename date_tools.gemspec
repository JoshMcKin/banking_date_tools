# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "banking_date_tools/version"

Gem::Specification.new do |s|
  s.name        = "banking_date_tools" 
  s.version     = BankingDateTools::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joshua T Mckinney"]
  s.email       = ["joshmckin@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Banking Date Tools}
  s.description = %q{Banking Date Tools}

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-autotest"
  s.add_development_dependency "autotest"
  s.add_development_dependency "mocha"
  s.rubyforge_project = "banking_date_tools"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
