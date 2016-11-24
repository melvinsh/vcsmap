module Vcsmap
  module Helpers
    def self.project_directory
      File.dirname(File.dirname(__FILE__)).to_s
    end
  end
end
