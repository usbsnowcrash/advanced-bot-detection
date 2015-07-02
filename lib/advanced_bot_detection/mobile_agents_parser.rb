module AdvancedBotDetection
  class MobileAgentsParser
    require 'json'

    def initialize
      url = 'https://raw.githubusercontent.com/serbanghita/Mobile-Detect/master/Mobile_Detect.json'
      @mobile_hash = JSON.load(open(url))
    end

    def agents
      agents = []
      parse_browsers(agents)
      parse_tablets(agents)
      parse_phones(agents)
      agents
    end

    def to_array
      agents
    end
    alias_method :to_a, :to_array

    def to_yaml
      agents.to_yaml
    end

    private

    def parse_browsers(agents)
      phones = @mobile_hash['uaMatch']['browsers'].each_pair { |k, v| puts "#{k}: #{v}" }
      phones.each_pair do |name, match|
        agents << parse_agent('mobile_browser', name, match)
      end
    end

    def parse_phones(agents)
      phones = @mobile_hash['uaMatch']['phones'].each_pair { |k, v| puts "#{k}: #{v}" }
      phones.each_pair do |name, match|
        agents << parse_agent('phone', name, match)
      end
    end

    def parse_tablets(agents)
      tablets = @mobile_hash['uaMatch']['tablets'].each_pair { |k, v| puts "#{k}: #{v}" }
      tablets.each_pair do |name, match|
        agents << parse_agent('tablet', name, match)
      end
    end

    def parse_agent(type, name, match)
      {
        'string' => match.gsub('\\b', '\b').gsub('/', '\/'),
        'string_match' => 'regex', # exact or regex
        'types' => type,
        'description' => name
      }
    end
  end
end
