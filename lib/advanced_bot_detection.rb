require 'advanced_bot_detection/test'
require 'advanced_bot_detection/user_agents_parser'
require 'advanced_bot_detection/mobile_agents_parser'
require 'advanced_bot_detection/usbsnowcrash_parser'
require 'advanced_bot_detection/engine' if defined?(Rails)

module AdvancedBotDetection
  class << self
    def root
      require 'pathname'
      Pathname.new File.expand_path '..', File.dirname(__FILE__)
    end

    def human?(user_agent_string)
      test(user_agent_string).human?
    end

    def bot?(user_agent_string)
      test(user_agent_string).bot?
    end

    def browser?(user_agent_string)
      test(user_agent_string).browser?
    end

    def checker?(user_agent_string)
      test(user_agent_string).checker?
    end

    def downloader?(user_agent_string)
      test(user_agent_string).downloader?
    end

    def proxy?(user_agent_string)
      test(user_agent_string).proxy?
    end

    def crawler?(user_agent_string)
      test(user_agent_string).crawler?
    end

    def spam?(user_agent_string)
      test(user_agent_string).spam?
    end

    def mobile_browser?(user_agent_string)
      test(user_agent_string).mobile_browser?
    end

    def tablet?(user_agent_string)
      test(user_agent_string).tablet?
    end

    def phone?(user_agent_string)
      test(user_agent_string).phone?
    end

    def mobile?(user_agent_string)
      test(user_agent_string).mobile?
    end

    private

    def test(user_agent_string)
      AdvancedBotDetection::Test.new(user_agent_string)
    end
  end
end
