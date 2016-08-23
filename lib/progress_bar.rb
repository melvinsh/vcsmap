module Vcsmap
  class ProgressBar
    def initialize(count)
      @bar = TTY::ProgressBar.new("Loading #{count} possible results [:bar]", total: count)
    end

    def step
      @bar.advance
    end

    def clear
      print "\r"
      $stdout.flush
    end
  end
end
