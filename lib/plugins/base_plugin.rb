module Vcsmap
  module Plugin
    class BasePlugin
      attr_reader :search_string

      def capture_match(regex, file)
        match = regex.match(clean_file(file))
        return '' if match.nil?
        match.captures.first
      end

      private

      def clean_file(file)
        file.scrub
      end
    end
  end
end
