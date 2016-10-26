require 'tty'
require 'csv'
require 'http'
require 'yaml'
require 'nokogiri'
require 'require_all'

require_relative 'lib/cli'
require_relative 'lib/csv_writer'
require_relative 'lib/helpers'
require_relative 'lib/plugin'
require_relative 'lib/plugin_list'
require_relative 'lib/provider'
require_relative 'lib/progress_bar'

require_all 'lib/plugins'
require_all 'lib/providers'

module Vcsmap
  VERSION = '1.0.3'.freeze

  cli = Vcsmap::CLI.new(ARGV)
  cli.run
end
