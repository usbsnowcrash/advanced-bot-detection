require 'json'
require 'pry'
namespace :'advanced_bot_detection' do
  desc 'Import a new user_agents.yml file'
  task :import_user_agents_org, :url do |_t, args|
    args.with_defaults url: 'http://www.user-agents.org/allagents.xml'
    agents = AdvancedBotDetection::UserAgentsParser.new(args[:url])

    file = File.open(Rails.root.join('config', 'user_agents.yml'), 'w')
    file.write(agents.to_yaml)
  end

  desc 'Import a new mobile_devices.yml file'
  task :import_user_agents_org, :url do |_t, args|
    args.with_defaults url: 'https://raw.githubusercontent.com/serbanghita/Mobile-Detect/master/Mobile_Detect.json'

    binding.pry

    #file = File.open(Rails.root.join('config', 'mobile_devices.yml'), 'w')
    #file.write(agents.to_yaml)
  end
end
