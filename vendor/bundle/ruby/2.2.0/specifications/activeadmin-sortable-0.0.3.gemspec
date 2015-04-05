# -*- encoding: utf-8 -*-
# stub: activeadmin-sortable 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin-sortable"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Adam McCrea"]
  s.date = "2014-01-15"
  s.description = "Drag and drop sort interface for ActiveAdmin tables"
  s.email = ["adam@adamlogic.com"]
  s.homepage = "https://github.com/newcontext/activeadmin-sortable"
  s.rubygems_version = "2.4.5"
  s.summary = "Drag and drop sort interface for ActiveAdmin tables"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activeadmin>, [">= 0.4"])
    else
      s.add_dependency(%q<activeadmin>, [">= 0.4"])
    end
  else
    s.add_dependency(%q<activeadmin>, [">= 0.4"])
  end
end
