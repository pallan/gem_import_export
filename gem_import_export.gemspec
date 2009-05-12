# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gem_import_export}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peer Allan"]
  s.date = %q{2009-05-11}
  s.email = %q{peer@canadadrugs.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "gem_import_export.gemspec",
     "lib/rubygems/commands/export_command.rb",
     "lib/rubygems/commands/import_command.rb",
     "lib/rubygems_plugin.rb",
     "spec/gem_import_export_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/pallan/gem_import_export}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Adds the commands to RubyGems for importing and exporting repositories using a command plugin}
  s.test_files = [
    "spec/gem_import_export_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
