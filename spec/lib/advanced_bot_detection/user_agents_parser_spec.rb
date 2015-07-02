require 'spec_helper'

RSpec.describe AdvancedBotDetection::UserAgentsParser do
  subject { AdvancedBotDetection::UserAgentsParser.new }

  before do
    stub_request(:any, 'http://www.user-agents.org/allagents.xml')
        .to_return(status: 200,
                   headers: { 'Content-Length' => 3 },
                   body: <<eos)
<user-agents>
   <user-agent>
      <ID>example1</ID>
      <String>Example 1</String>
      <Description>Example1</Description>
      <Type>B C P R S</Type>
      <Comment />
      <Link1>http://www.sync2it.com</Link1>
      <Link2 />
   </user-agent>
   <user-agent>
      <ID>example2</ID>
      <String>Example 2</String>
      <Description>Example 2</Description>
      <Type>S</Type>
      <Comment>Site is dead</Comment>
      <Link1>http://www.unchaos.com/</Link1>
      <Link2 />
   </user-agent>
</user-agents>
eos
  end

  it { is_expected.to respond_to(:to_a, :to_array) }
  it { is_expected.to respond_to(:to_yaml) }

  describe '#agents' do
    it 'parses the user agents xml into an array' do
      expect(subject.agents).to be_a Array
    end

    it 'pulls all the values out of the xml' do
      expect(subject.agents.count).to eq 2
    end

    it 'contains the correct values' do
      user_agent = subject.agents[0]
      expect(user_agent['string']).to eq 'Example 1'
      expect(user_agent['string_match']).to eq 'exact'
      expect(user_agent['types']).to eq %w(browser checker proxy crawler spam)
      expect(user_agent['description']).to eq 'Example1'
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
- string: Example 1
  string_match: exact
  types:
  - browser
  - checker
  - proxy
  - crawler
  - spam
  description: Example1
- string: Example 2
  string_match: exact
  types:
  - spam
  description: Example 2
eos
    end
  end


end
