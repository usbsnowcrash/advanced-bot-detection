module ActionDispatch
  class Request
    def bot?
      agent_tester.bot?
    end

    def checker?
      agent_tester.checker?
    end

    def proxy?
      agent_tester.proxy?
    end

    def crawler?
      agent_tester.crawler?
    end

    def spam?
      agent_tester.spam?
    end

    def mobile?
      agent_tester.mobile?
    end

    def tablet?
      agent_tester.tablet?
    end

    def phone?
      agent_tester.phone?
    end

    private

    def agent_tester
      @advanced_bot_detection ||= AdvancedBotDetection::Test.new(user_agent)
    end
  end
end
