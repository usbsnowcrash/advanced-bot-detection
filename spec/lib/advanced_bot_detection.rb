require 'spec_helper'

RSpec.describe AdvancedBotDetection do
  describe '#human?' do
    it { expect(AdvancedBotDetection.human?(HUMAN)).to be_truthy }
  end

  describe '#bot?' do
    it { expect(AdvancedBotDetection.bot?(BOT)).to be_truthy }
  end

  describe '#mobile?' do
    it { expect(AdvancedBotDetection.mobile?(MOBILE)).to be_truthy }
  end

  describe '#browser?' do
    it { expect(AdvancedBotDetection.browser?(DESKTOP_BROWSER)).to be_truthy }
  end

  describe '#checker?' do
    it { expect(AdvancedBotDetection.checker?(CHECKER)).to be_truthy }
  end

  describe '#downloader?' do
    it { expect(AdvancedBotDetection.downloader?(DOWNLOADER)).to be_truthy }
  end

  describe '#proxy?' do
    it { expect(AdvancedBotDetection.proxy?(PROXY)).to be_truthy }
  end

  describe '#crawler?' do
    it { expect(AdvancedBotDetection.crawler?(CRAWLER)).to be_truthy }
  end

  describe '#spammer?' do
    it { expect(AdvancedBotDetection.spam?(SPAM)).to be_truthy }
  end

  describe '#tablet?' do
    it { expect(AdvancedBotDetection.tablet?(TABLET)).to be_truthy }
  end

  describe '#phone?' do
    it { expect(AdvancedBotDetection.phone?(PHONE)).to be_truthy }
  end

  describe '#mobile_browser?' do
    it { expect(AdvancedBotDetection.mobile_browser?(MOBILE_BROWSER)).to be_truthy }
  end
end
