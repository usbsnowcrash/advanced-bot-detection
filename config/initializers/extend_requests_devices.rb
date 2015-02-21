module ActionDispatch
  class Request
    def mobile?
      agent_tester.mobile?
    end

    def tablet?
      agent_tester.tablet?
    end

    def phone?
      agent_tester.phone?
    end

    def mobile_browser?
      agent_tester.mobile_browser?
    end

    private

    def agent_tester
      @advanced_bot_detection ||= AdvancedBotDetection::Test.new(user_agent)
    end
  end
end
