module Vcsmap
  module Plugin
    class SolrDataconfig < Vcsmap::Plugin::BasePlugin
      def initialize
        @search_string = 'filename:dataConfig.xml+dataSource+JdbcDataSource+password'
        @url_regex = /url=\"(jdbc(.*?))\"/
        @username_regex = /user=\"(.*?)\"/
        @password_regex = /password=\"(.*?)\"/
      end

      def credentials(file)
        @url = capture_match(@url_regex, file)
        @user = capture_match(@username_regex, file)
        @pass = capture_match(@password_regex, file)
        ['JDBC', @url, @user, @pass]
      end

      def table_header
        %w(Protocol URL Username Password)
      end
    end
  end
end
