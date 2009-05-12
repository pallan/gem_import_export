require 'rubygems/command'

##
# An alternate to Gem::Commands::QueryCommand that searches for gems starting
# with the the supplied argument.

class Gem::Commands::ExportCommand < Gem::Command

  def initialize
    super 'export', 'Dumps your currently installed gems into yaml'
  end

  def arguments # :nodoc:
    "GEMFILE        location to save the export to"
  end

  def defaults_str # :nodoc:
    ""
  end

  def usage # :nodoc:
    "#{program_name} GEMFILE"
  end

  def execute

    export_file = get_one_optional_argument

    unless export_file then
      raise Gem::CommandLineError,
            "Please specify a file to save the export to"
    end    
    
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
    
    File.open(export_file, 'w') do |f|
      f.write output.to_yaml
    end
  end

end

