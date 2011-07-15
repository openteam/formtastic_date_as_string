# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "formtastic_date_as_string/version"

Gem::Specification.new do |s|
  s.name        = "formtastic_date_as_string"
  s.version     = FormtasticDateAsString::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dmitry Lihachev", "Evgeny Lapin"]
  s.email       = ["lda@openteam.ru", "lev@openteam.ru"]
  s.homepage    = "http://github.com/openteam/formtastic_date_as_string"
  s.summary     = %q{Creates input :as => :string for date firld}
  s.description = %q{Creates input :as => :string for date field}

  s.add_dependency "formtastic"

  s.rubyforge_project = "formtastic_date_as_string"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
