require 'csv'

module Vcsmap
  class CsvWriter
    def initialize(plugin_name, plugin_header, data)
      @file_path = file_path(plugin_name)
      @header = header(plugin_header)
      @data = data
    end

    def write!
      puts "Writing CSV to #{@file_path} ..."
      CSV.open(@file_path, 'wb', force_quotes: true) do |csv|
        csv << @header
        @data.each do |line|
          csv << line
        end
      end
    end

    private

    def folder
      "#{Dir.pwd}/"
    end

    def file_path(plugin_name)
      folder + "#{DateTime.now.strftime('%Y%m%dT%H%M')}-#{plugin_name}.csv"
    end

    def header(plugin_header)
      plugin_header << 'Repo'
    end
  end
end
