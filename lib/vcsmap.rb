require 'http'
require 'yaml'
require 'nokogiri'

# TODO: include only if needed
require_relative 'vcsmap/cli'
require_relative 'vcsmap/csv_writer'
require_relative 'vcsmap/progress_bar'

require_relative 'vcsmap/helpers'
require_relative 'vcsmap/plugin'
require_relative 'vcsmap/plugin_list'
require_relative 'vcsmap/provider'

# TODO: work on require_all
require_relative 'vcsmap/plugins/base_plugin'
require_relative 'vcsmap/plugins/aws_access_token'
require_relative 'vcsmap/plugins/facebook_client_secrets'
require_relative 'vcsmap/plugins/filezilla_xml'
require_relative 'vcsmap/plugins/github_sublimesettings'
require_relative 'vcsmap/plugins/google_oauth'
require_relative 'vcsmap/plugins/instagram_tokens'
require_relative 'vcsmap/plugins/solr_dataconfig'
require_relative 'vcsmap/plugins/wordpress_config'

require_relative 'vcsmap/providers/github'

module Vcsmap
  VERSION = '2.0.0'.freeze
end
