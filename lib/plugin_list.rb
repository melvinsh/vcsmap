module Vcsmap
  class PluginList
    PLUGINS = {
      wordpress_config: {
        title: 'Wordpress configuration files',
        description: 'Extracts database credentials from wp-config.php.',
        class_name: 'Vcsmap::Plugin::WordpressConfig'
      },
      google_oauth: {
        title: 'Google oAuth tokens',
        description: 'Extracts oAuth credentials from client_secrets.json.',
        class_name: 'Vcsmap::Plugin::GoogleOauth'
      },
      filezilla_xml: {
        title: 'Filezilla configuration XML',
        description: 'Extracts FTP credentials from Filezilla configuration files.',
        class_name: 'Vcsmap::Plugin::FilezillaXml'
      },
      solr_dataconfig: {
        title: 'Solr dataConfig.xml credentials',
        description: 'Extracts JdbcDataSource credentials from a Solor dataConfig.xml.',
        class_name: 'Vcsmap::Plugin::SolrDataconfig'
      },
      sublime_github: {
        title: 'Sublime Text GitHub tokens',
        description: 'Extracts GitHub tokens from the Sublime Text settings file for GitHub.',
        class_name: 'Vcsmap::Plugin::GithubSublimesettings'
      },
      facebook_secrets: {
        title: 'Facebook app secret',
        description: 'Extracts Facebook tokens from fb_client_secrets.json.',
        class_name: 'Vcsmap::Plugin::FacebookClientSecrets'
      },
      instagram_tokens: {
        title: 'Instagram access tokens',
        description: 'Extracts Instagram access tokens.',
        class_name: 'Vcsmap::Plugin::InstagramTokens'
      }
    }.freeze

    def self.all
      PLUGINS.sort
    end

    def self.find(name)
      PLUGINS.fetch(name.to_sym)
    end

    def self.render_list
      all.each do |plugin|
        puts Pastel.new.green "[#{plugin[0]}] #{plugin[1][:title]}"
        puts plugin[1][:description]
        puts
      end
    end
  end
end
