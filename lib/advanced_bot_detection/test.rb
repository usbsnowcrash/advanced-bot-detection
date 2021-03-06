module AdvancedBotDetection
  class Test
    class << self; attr_accessor :agents end
    attr_accessor :user_agent_string
    attr_accessor :types
    @agents ||= []

    def initialize(user_agent_string)
      load_agents
      @user_agent_string = user_agent_string

      @types = agent.map do |a|
        Array(a['types']).map(&:to_sym)
      end.flatten
    end

    def agent
      @agents ||= Test.agents.select do |agent|
        if agent['string_match'] == 'regex'
          @user_agent_string =~ Regexp.new(agent['string'], Regexp::IGNORECASE)
        else
          @user_agent_string.to_s.casecmp(agent['string'].to_s) == 0
        end
      end || []
    end

    def type?(*types)
      return nil if agent.empty?

      types.any? do |type|
        @types.include? type
      end
    end

    def browser?
      type? :browser
    end

    def human?
      type?(:browser, :downloader, :proxy, :tablet, :phone)
    end

    def bot?
      type?(:checker, :crawler, :spam)
    end

    def checker?
      type? :checker
    end

    def downloader?
      type? :downloader
    end

    def proxy?
      type? :proxy
    end

    def crawler?
      type? :crawler
    end

    def spam?
      type? :spam
    end

    def mobile?
      type?(:tablet, :phone, :mobile_browser)
    end

    def tablet?
      type? :tablet
    end

    def phone?
      type? :phone
    end

    def mobile_browser?
      type? :mobile_browser
    end

    private

    def load_agents
      Test.agents ||= []
      return unless Test.agents.empty?

      rel_path = ['config', 'user_agents.yml']
      paths.any? do |base_path|
        if File.exist? base_path.join(*rel_path)
          Test.agents = YAML.load(File.open(base_path.join(*rel_path), 'r'))
        end
      end
    end

    def paths
      base_paths = []
      base_paths << Rails.root if defined? Rails
      base_paths << AdvancedBotDetection.root
      base_paths
    end
  end
end
