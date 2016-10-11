module Vcsmap
  module Plugin
    class Instagram < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'instagram+access_token'
        @access_token_regex = /([0-9]{9,10}\.[a-f0-9]{7}\.[a-f0-9]{31,32})/
      end

      def credentials(file)
        @access_token = capture_match(@access_token_regex, file)
        ['Instagram', @access_token]
      end

      def table_header
        %w(Protocol Access Token)
      end
    end
  end
end