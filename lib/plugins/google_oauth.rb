module Vcsmap
  module Plugin
    class GoogleOauth < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'filename:client_secrets.json+.apps.googleusercontent.com'
        @client_id_regex = /(?:\"|')client_id(?:\"|')\:(?:\ |)(?:\"|')(.*?)(?:\"|')/i
        @client_secret_regex = /(?:\"|')client_secret(?:\"|')\:(?:\ |)(?:\"|')(.*?)(?:\"|')/i
      end

      def credentials(file)
        @client_id = capture_match(@client_id_regex, file)
        @client_secret = capture_match(@client_secret_regex, file)
        ['oAuth', @client_id, @client_secret]
      rescue NoMethodError
        []
      end

      def table_header
        %w(protocol client_id client_secret)
      end
    end
  end
end
