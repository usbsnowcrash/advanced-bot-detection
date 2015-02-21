namespace :'advanced_bot_detection' do
  desc 'Import a new user_agents.yml file'
  task :import_user_agents do |_t, _args|
    agents = AdvancedBotDetection::UserAgentsParser.new.agents
    agents += AdvancedBotDetection::MobileAgentsParser.new.agents
    agents += AdvancedBotDetection::UsbsnowcrashParser.new.agents
    file = File.open(Rails.root.join('config', 'user_agents.yml'), 'w')
    file.write(agents.to_yaml)
  end
end
