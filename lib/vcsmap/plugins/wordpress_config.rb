module Vcsmap
  module Plugin
    class WordpressConfig < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'filename:wp-config.php+DB_PASSWORD'
        @host_regex = /(?:\'|\")DB_HOST(?:\'|\")\,(?:\ |)(?:\'|\")(.*?)(?:\'|\")/i
        @username_regex = /(?:\'|\")DB_USER(?:\'|\")\,(?:\ |)(?:\'|\")(.*?)(?:\'|\")/i
        @password_regex = /(?:\'|\")DB_PASSWORD(?:\'|\")\,(?:\ |)(?:\'|\")(.*?)(?:\'|\")/i
        @database_regex = /(?:\'|\")DB_NAME(?:\'|\")\,(?:\ |)(?:\'|\")(.*?)(?:\'|\")/i
      end

      def credentials(file)
        @host = capture_match(@host_regex, file)
        @user = capture_match(@username_regex, file)
        @pass = capture_match(@password_regex, file)
        @database = capture_match(@database_regex, file)
        ['MySQL', @host, @user, @pass, @database]
      rescue NoMethodError
        []
      end

      def table_header
        %w(Protocol Host Username Password Database)
      end
    end
  end
end
