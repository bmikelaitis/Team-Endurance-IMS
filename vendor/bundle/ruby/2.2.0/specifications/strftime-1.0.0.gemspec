# -*- encoding: utf-8 -*-
# stub: strftime 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "strftime"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jim Gay"]
  s.date = "2010-11-04"
  s.description = "Convenient list of strftime format directives"
  s.email = ["jim@saturnflyer.com"]
  s.homepage = "http://rubygems.org/gems/strftime"
  s.post_install_message = "\n  Thanks for installing strftime. You can use these methods to\n  better understand the formats used in Date and Time strftime\n  \n  Strftime::Directives       #=> a full hash of directives\n  Strftime::Directives['%y'] #=> a hash of description and \n                             #   optional example value\n                             \n  Strftime::Directives['y']  #=> optionally exclude the %\n   \n  strfd                      #=> shorthand to get directives\n  strfd('y')                 #=> shorthand to get details\n  "
  s.rubygems_version = "2.4.6"
  s.summary = "Convenient list of strftime format directives"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version
end
