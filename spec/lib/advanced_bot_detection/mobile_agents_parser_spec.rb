require 'spec_helper'

RSpec.describe AdvancedBotDetection::MobileAgentsParser do
  subject { AdvancedBotDetection::MobileAgentsParser.new }

  before do
    stub_request(:any, 'https://raw.githubusercontent.com/serbanghita/Mobile-Detect/master/Mobile_Detect.json')
        .to_return(status: 200,
                   headers: { 'Content-Length' => 3 },
                   body: <<eos)
{
  "version": "2.8.15",
  "headerMatch": {
    "HTTP_ACCEPT": {
      "matches": [
        "application\/x-obml2d",
        "application\/vnd.rim.html",
        "text\/vnd.wap.wml",
        "application\/vnd.wap.xhtml+xml"
      ]
    },
    "HTTP_X_WAP_PROFILE": null,
    "HTTP_UA_CPU": {
      "matches": [
        "ARM"
      ]
    }
  },
  "uaHttpHeaders": [
    "HTTP_USER_AGENT"
  ],
  "uaMatch": {
    "phones": {
      "phone1": "\\biPhone\\b|\\biPod\\b",
      "phone2": "BlackBerry|\\bBB10\\b|rim[0-9]+"
    },
    "tablets": {
      "tablet1": "iPad|iPad.*Mobile",
      "tablet2": "Android.*Nexus[\\s]+(7|9|10)|^.*Android.*Nexus(?:(?!Mobile).)*$"
    },
    "browsers": {
      "browser1": "\\bCrMo\\b|CriOS|Android.*Chrome\/[.0-9]* (Mobile)?"
    },
    "os": {
      "browser2": "Android"
    },
    "utilities": {
      "util1": "Googlebot"
    }
  }
}
eos
  end

  it { is_expected.to respond_to(:to_a, :to_array) }
  it { is_expected.to respond_to(:to_yaml) }

  describe '#agents' do
    it 'parses the user agents xml into an array' do
      expect(subject.agents).to be_a Array
    end

    it 'pulls all the values out of the xml' do
      expect(subject.agents.count).to eq 5
    end

    it 'contains the correct values' do
      user_agent = subject.agents[3]
      expect(user_agent['string']).to eq "\biPhone\b|\biPod\b"
      expect(user_agent['string_match']).to eq 'regex'
      expect(user_agent['types']).to eq 'phone'
      expect(user_agent['description']).to eq 'phone1'
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
      expect(subject.to_yaml).to be_a String
    end
  end

end
