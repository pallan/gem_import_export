require 'rubygems/command'
require 'rubygems/commands/query_command'

##
# An alternate to Gem::Commands::QueryCommand that searches for gems starting
# with the the supplied argument.

class Gem::Commands::ExportCommand < Gem::Commands::QueryCommand

  def initialize
    super 'export', 'Dumps your currently installed gems into yaml'

    remove_option('--name-matches')
    options[:format] = 'yaml'
  end

  def arguments # :nodoc:
    "STRING        start of gem name to look for"
  end

  def defaults_str # :nodoc:
    "--local --no-details --format yaml"
  end

  def usage # :nodoc:
    "#{program_name} [STRING]"
  end

end

