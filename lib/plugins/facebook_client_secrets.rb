module Vcsmap
  module Plugin
    class FacebookClientSecrets < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'filename:fb_client_secrets.json+app_secret'
        @app_id_regex = /(?:\"|')app_id(?:\"|')\:(?:\ |)(?:\"|')(.*?)(?:\"|')/i
        @app_secret_regex = /(?:\"|')app_secret(?:\"|')\:(?:\ |)(?:\"|')(.*?)(?:\"|')/i
      end

      def credentials(file)
        @app_id = capture_match(@app_id_regex, file)
        @app_secret = capture_match(@app_secret_regex, file)
        ['oAuth', @app_id, @app_secret]
      rescue NoMethodError
        []
      end

      def table_header
        %w(Protocol app_id app_secret)
      end
    end
  end
end
