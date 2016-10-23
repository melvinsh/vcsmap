module Vcsmap
  module Plugin
    class AwsAccessToken < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = ['aws_secret_access_key',
                          'filename:config',
                          'filename:credentials'].join('+')
        @access_key_id_regex = /=\s+(AKIA[0-9A-Z]{16})/
        @secret_access_key_regex = %r{=\s+([0-9a-zA-Z\/+]{40})}
      end

      def credentials(file)
        @access_key_id = capture_match(@access_key_id_regex, file)
        @secret_access_key = capture_match(@secret_access_key_regex, file)
        [@access_key_id, @secret_access_key]
      rescue NoMethodError
        []
      end

      def table_header
        ['Access Key ID', 'Secret Access Key']
      end
    end
  end
end
