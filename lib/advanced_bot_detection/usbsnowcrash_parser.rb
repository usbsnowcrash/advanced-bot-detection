module AdvancedBotDetection
  class UsbsnowcrashParser
    require 'yaml'

    def initialize
      url = 'https://raw.githubusercontent.com/usbsnowcrash/advanced-bot-detection/master/custom-add-ons.yml'
      @agents = YAML.load(open(url))
    end

    attr_reader :agents

    def to_array
      agents
    end
    alias_method :to_a, :to_array

    def to_yaml
      agents.to_yaml
    end
  end
end
