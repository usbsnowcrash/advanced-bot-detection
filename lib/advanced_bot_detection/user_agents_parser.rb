module AdvancedBotDetection
  class UserAgentsParser
    attr_reader :types

    require 'nokogiri'
    require 'httpclient'

    def initialize
      @xml = HTTPClient.new.get_content('http://www.user-agents.org/allagents.xml')
      @types = { b: 'browser', c: 'checker', d: 'downloader', p: 'proxy', r: 'crawler', s: 'spam' }
    end

    def agents
      agents = []
      xml = Nokogiri::XML(@xml)
      xml.xpath('//user-agent').each do |agent|
        agents << parse_agent(agent)
      end
      agents
    end

    def parse_agent(agent)
      {
        'string' => agent.xpath('String').text,
        'string_match' => 'exact',
        'types' => agent.xpath('Type').text.split.map { |t| clarify_type(t) }.compact,
        'description' => agent.xpath('Description').text
      }
    end

    def to_array
      agents
    end
    alias_method :to_a, :to_array

    def to_yaml
      agents.to_yaml
    end

    private

    def clarify_type(type)
      @types[type.downcase.to_sym]
    end
  end
end
