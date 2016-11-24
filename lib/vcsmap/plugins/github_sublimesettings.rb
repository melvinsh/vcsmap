module Vcsmap
  module Plugin
    class GithubSublimesettings < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'filename:GitHub.sublime-settings+github_token'
        @token_regex = /(?:\"|')github_token(?:\"|')\:(?:\ |)(?:\"|')(.*?)(?:\"|')/i
      end

      def credentials(file)
        @token = capture_match(@token_regex, file)
        ['GitHub token', @token]
      rescue NoMethodError
        []
      end

      def table_header
        %w(Protocol Token)
      end
    end
  end
end
