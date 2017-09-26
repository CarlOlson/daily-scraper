require "daily_scraper/version"

module DailyScraper
  class Task
    attr_reader :url, :plugins

    def initialize url
      @url = url
      @plugins = []
    end

    def plugin plugin
      @plugins << plugin
    end
  end

  def self.goto url
    Task.new(url).tap { |t| yield t if block_given? }
  end
end
