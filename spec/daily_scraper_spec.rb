require "spec_helper"

RSpec.describe DailyScraper do
  it "has a version number" do
    expect(DailyScraper::VERSION).not_to be nil
  end

  describe "goto" do
    let(:a_url) { "http://example.com" }

    it "should return a task object" do
      expect(DailyScraper.goto a_url).not_to be nil
    end

    it "should accept a url" do
      task = DailyScraper.goto a_url
      expect(task.url).to eq a_url
    end
  end
end
