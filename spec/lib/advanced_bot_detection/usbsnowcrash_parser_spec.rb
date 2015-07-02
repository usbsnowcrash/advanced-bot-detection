require 'spec_helper'

RSpec.describe AdvancedBotDetection::UsbsnowcrashParser do
  subject { AdvancedBotDetection::UsbsnowcrashParser.new }

  before do
    stub_request(:any, 'https://raw.githubusercontent.com/usbsnowcrash/advanced-bot-detection/master/custom-add-ons.yml')
        .to_return(status: 200,
                   headers: { 'Content-Length' => 3 },
                   body: <<eos)
- string: Example1
  string_match: regex
  types:
  - checker
  description: This is a description
- string: ELB-HealthChecker
  string_match: regex
  types:
  - checker
  description: Amazon ELB health check
eos
  end

  it { is_expected.to respond_to(:to_a, :to_array) }
  it { is_expected.to respond_to(:to_yaml) }

  describe '#agents' do
    it 'parses the user agents yaml into an array' do
      expect(subject.agents).to be_a Array
    end

    it 'pulls all the values out of the xml' do
      expect(subject.agents.count).to eq 2
    end

    it 'contains the correct values' do
      user_agent = subject.agents[0]
      expect(user_agent['string']).to eq 'Example1'
      expect(user_agent['string_match']).to eq 'regex'
      expect(user_agent['types']).to eq %w(checker)
      expect(user_agent['description']).to eq 'This is a description'
    end
  end

  describe '#to_a' do
    it { expect(subject.to_a).to eq subject.agents  }
  end

  describe '#to_array' do
    it { expect(subject.to_array).to eq subject.agents  }
  end

  describe '#to_yaml' do
    it 'converts the array into yaml' do
      expect(subject.to_yaml).to eq <<eos
---
- string: Example1
  string_match: regex
  types:
  - checker
  description: This is a description
- string: ELB-HealthChecker
  string_match: regex
  types:
  - checker
  description: Amazon ELB health check
eos
    end
  end

end
