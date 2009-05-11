require 'rubygems/command'

##
# An alternate to Gem::Commands::QueryCommand that searches for gems starting
# with the the supplied argument.

class Gem::Commands::ExportCommand < Gem::Command

  def initialize
    super 'export', 'Dumps your currently installed gems into yaml'
  end

  def arguments # :nodoc:
    "FILE        location to save the export to"
  end

  def defaults_str # :nodoc:
    ""
  end

  def usage # :nodoc:
    "#{program_name} [FILE]"
  end

  def execute
    dep = Gem::Dependency.new //, Gem::Requirement.default
    specs = Gem.source_index.search dep

    gems = []

    specs.map do |spec|
      gems << { 
          :name             => spec.name, 
          :version          => spec.version.to_s,
          :install_options  => '' 
        }
    end

    output = {'sources' => Gem.sources, 'gems' => gems}
    say output.to_yaml
  end

end

