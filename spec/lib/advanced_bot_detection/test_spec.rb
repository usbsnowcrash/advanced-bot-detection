require 'spec_helper'

RSpec.describe AdvancedBotDetection::Test do

  describe '#human?' do
    subject { AdvancedBotDetection::Test.new(HUMAN) }
    before do
      expect(subject).to receive(:type?).with(:browser, :downloader, :proxy, :tablet, :phone)
                                               .and_call_original
    end
    it { expect(subject.human?).to be_truthy }
  end

  describe '#bot?' do
    subject { AdvancedBotDetection::Test.new(BOT) }
    before { expect(subject).to receive(:type?).with(:checker, :crawler, :spam).and_call_original }
    it { expect(subject.bot?).to be_truthy }
  end

  describe '#mobile?' do
    subject { AdvancedBotDetection::Test.new(MOBILE) }
    before { expect(subject).to receive(:type?).with(:tablet, :phone, :mobile_browser).and_call_original }
    it { expect(subject.mobile?).to be_truthy }
  end

  describe '#browser?' do
    subject { AdvancedBotDetection::Test.new(DESKTOP_BROWSER) }
    before { expect(subject).to receive(:type?).with(:browser).and_call_original }
    it { expect(subject.browser?).to be_truthy }
  end

  describe '#checker?' do
    subject { AdvancedBotDetection::Test.new(CHECKER) }
    before { expect(subject).to receive(:type?).with(:checker).and_call_original }
    it { expect(subject.checker?).to be_truthy }
  end

  describe '#downloader?' do
    subject { AdvancedBotDetection::Test.new(DOWNLOADER) }
    before { expect(subject).to receive(:type?).with(:downloader).and_call_original }
    it { expect(subject.downloader?).to be_truthy }
  end

  describe '#proxy?' do
    subject { AdvancedBotDetection::Test.new(PROXY) }
    before { expect(subject).to receive(:type?).with(:proxy).and_call_original }
    it { expect(subject.proxy?).to be_truthy }
  end

  describe '#crawler?' do
    subject { AdvancedBotDetection::Test.new(CRAWLER) }
    before { expect(subject).to receive(:type?).with(:crawler).and_call_original }
    it { expect(subject.crawler?).to be_truthy }
  end

  describe '#spammer?' do
    subject { AdvancedBotDetection::Test.new(SPAM) }
    before { expect(subject).to receive(:type?).with(:spam).and_call_original }
    it { expect(subject.spam?).to be_truthy }
  end

  describe '#tablet?' do
    subject { AdvancedBotDetection::Test.new(TABLET) }
    before { expect(subject).to receive(:type?).with(:tablet).and_call_original }
    it { expect(subject.tablet?).to be_truthy }
  end

  describe '#phone?' do
    subject { AdvancedBotDetection::Test.new(PHONE) }
    before { expect(subject).to receive(:type?).with(:phone).and_call_original }
    it { expect(subject.phone?).to be_truthy }
  end

  describe '#mobile_browser?' do
    subject { AdvancedBotDetection::Test.new(MOBILE_BROWSER) }
    before { expect(subject).to receive(:type?).with(:mobile_browser).and_call_original }
    it { expect(subject.mobile_browser?).to be_truthy }
  end

end
