require 'spec_helper'

RSpec.describe AdvancedBotDetection::Test do



  describe '#browser?' do
    context 'when the user agent looks like a browser' do
      subject { AdvancedBotDetection::Test.new(DESKTOP_BROWSER) }
      it { expect(subject.browser?).to be_truthy }
    end

    context 'when the user agent does not look like a browser' do
      subject { AdvancedBotDetection::Test.new(CHECKER) }
      it { expect(subject.browser?).to be_falsey }
    end
  end
end