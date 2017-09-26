require "spec_helper"

RSpec.describe DailyScraper do
  it "has a version number" do
    expect(DailyScraper::VERSION).not_to be nil
  end

  describe "goto" do
    let(:a_url) { "http://example.com" }
    let(:canary) { spy "canary" }

    it "should return a task object" do
      expect(DailyScraper.goto a_url).not_to be nil
    end

    it "should accept a url" do
      task = DailyScraper.goto a_url
      expect(task.url).to eq a_url
    end

    it "should evaluate given blocks" do
      task = DailyScraper.goto(a_url) do
        canary.called
      end
      expect(canary).to have_received(:called).once
    end

    it "should register given plugins" do
      task = DailyScraper.goto(a_url) do |t|
        t.plugin canary
      end
      expect(task.plugins).to eq [canary]
    end
  end
end
