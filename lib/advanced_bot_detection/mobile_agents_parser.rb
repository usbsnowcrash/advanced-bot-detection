module AdvancedBotDetection
  class MobileAgentsParser
    require 'json'

    def initialize
      url = 'https://raw.githubusercontent.com/serbanghita/Mobile-Detect/master/Mobile_Detect.json'
      @mobile_hash = JSON.load(open(url))
    end

    def agents
      agents = []

      parse(agents,'browsers','mobile_browser')
      parse(agents,'tablets','tablet')
      parse(agents,'phones','phone')

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

    def parse(agents, child_node, type_name)
      parsed_agents = @mobile_hash['uaMatch'][child_node].each_pair { |k, v| puts "#{k}: #{v}" }
      parsed_agents.each_pair do |name, match|
        agents << parse_agent(type_name, name, match)
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
