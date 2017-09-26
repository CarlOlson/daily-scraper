require "daily_scraper/version"

module DailyScraper
  class Task
    attr_reader :url

    def initialize url
      @url = url
    end
  end

  def self.goto url
    Task.new url
  end
end
