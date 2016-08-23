module Vcsmap
  class CLI
    def initialize(arguments)
      @command = arguments[0]
      @plugin = arguments[1]
      @pages = arguments[2]
      @output = arguments[3]
    end

    def run
      case @command
      when 'list'
        list_plugins
      when 'run'
        run_plugin(@output === '--no-ascii')
      when nil
        abort "vcsmap requires a command. #{usage}"
      else
        abort "Command not recognized. #{usage}"
      end
    end

    private

    def usage
      'Check out README.md for instructions.'
    end

    def list_plugins
      puts "Available plugins:\n\n"
      PluginList.render_list
      exit
    end

    def run_plugin(no_ascii)
      begin
        plugin = PluginList.find(@plugin)
        plugin = Object.const_get(plugin[:class_name]).new
      rescue KeyError
        abort "Cannot find plugin with name '#{@plugin}'."
      rescue NameError
        abort "The plugin '#{@plugin}' has not been implemented yet."
      end

      abort 'Specify a number of pages to load after the plugin name (1 = ~10 results).' unless @pages

      puts 'Searching for matching files ...'
      provider = Vcsmap::Provider::GitHub.new
      results = provider.search(plugin, @pages.to_i)

      bar = Vcsmap::ProgressBar.new(results.count)

      data = []

      results.each do |result|
        bar.step
        file = HTTP.follow(true).get(result).body.to_s
        credentials = plugin.credentials(file)
        credentials << result.split('/').slice(3, 2).join('/')
        # TODO: make an object that holds credentials and has empty? and valid? methods.
        # this object should also be able to filter 'false' creds like localhost and default ones.
        data << credentials unless credentials[1].nil? || credentials[1].empty?
      end

      bar.clear

      csv_writer = Vcsmap::CsvWriter.new(@plugin, plugin.table_header, data)
      csv_writer.write!

      unless no_ascii
        table = TTY::Table.new plugin.table_header << 'Repo', data
        puts table.render(:ascii)
      end
    end
  end
end
