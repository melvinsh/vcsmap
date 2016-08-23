require 'tty'
require 'csv'
require 'http'
require 'yaml'
require 'nokogiri'

require_relative 'lib/cli'
require_relative 'lib/csv_writer'
require_relative 'lib/plugin'
require_relative 'lib/plugin_list'
require_relative 'lib/provider'
require_relative 'lib/progress_bar'

Dir.glob('lib/plugins/*.rb') { |f| require_relative f }
Dir.glob('lib/providers/*.rb') { |f| require_relative f }

module Vcsmap
  VERSION = "1.0.0"

  cli = Vcsmap::CLI.new(ARGV)
  cli.run
end
