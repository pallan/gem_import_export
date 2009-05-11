require 'rubygems/command'
require 'rubygems/commands/install_command'

class Gem::Commands::ImportCommand < Gem::Commands::InstallCommand

  def initialize
    super
  end

  def arguments # :nodoc:
    "GEM_LIST  Yaml file with the gems to install"
  end

  def usage # :nodoc:
    "#{program_name} GEMSPEC_FILE"
  end

  def execute
    options[:ignore_dependencies] = true
    installed_gems = []
    gemspec = get_one_gem_name
    if File.exist?(gemspec)
      data = YAML.load_file( gemspec )
      data['gems'].each do |g|
        begin
          inst = Gem::DependencyInstaller.new options
          inst.install g[:name], g[:version]
              
          inst.installed_gems.each do |spec|
            say "Successfully installed #{spec.full_name}"
          end
              
          installed_gems.push(*inst.installed_gems)
        rescue Gem::InstallError => e
          alert_error "Error installing #{g[:name]}:\n\t#{e.message}"
          exit_code |= 1
        rescue Gem::GemNotFoundException => e
          alert_error e.message
          exit_code |= 2
        end
      end
    else
      alert_error "Gemspec file not found: #{gemspec}"
    end
  end

end
