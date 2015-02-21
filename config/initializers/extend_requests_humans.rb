module ActionDispatch
  class Request
    def human?
      agent_tester.human?
    end

    def browser?
      agent_tester.browser?
    end

    def downloader?
      agent_tester.downloader?
    end

    private

    def agent_tester
      @advanced_bot_detection ||= AdvancedBotDetection::Test.new(user_agent)
    end
  end
end
