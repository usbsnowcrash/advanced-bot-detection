Advanced Bot Detection
=============
[![Code Climate](https://codeclimate.com/github/usbsnowcrash/advanced-bot-detection/badges/gpa.svg)](https://codeclimate.com/github/usbsnowcrash/advanced-bot-detection)
[![Gem Version](https://badge.fury.io/rb/advanced_bot_detection.svg)](http://badge.fury.io/rb/advanced_bot_detection)
[![Build Status](https://travis-ci.org/usbsnowcrash/advanced-bot-detection.svg?branch=master)](https://travis-ci.org/usbsnowcrash/advanced-bot-detection)

Advanced bot detection relies on [user agent](http://en.wikipedia.org/wiki/User_agent) list for its detection. It can easily tell you if a request is coming from a crawler, spider or bot. This can be especially helpful in analytics such as page hit tracking.

Installation
============
`gem install advanced_bot_detection`

Configuration
=============

A YAML file is used to match [user agent strings](http://simplyfast.info/browser) to their types.

If you'd like to use an [updated list](http://www.user-agents.org/) or make your own customizations, run `rake advanced_bot_detection:import_user_agents`. This will download a user_agents.yml file into your Rails `/config` directory.

To use [Regular Expression](http://en.wikipedia.org/wiki/Regular_expression) matching, just set `string_match: regex` in your user_agent entry. The first match will be used so you should probably put your Regular Expression entries toward the bottom of the file.

Usage
=====
There are three ways to use ABD

1. In your [Ruby on Rails](http://rubyonrails.org) controllers:  
   `request.bot?`

2. Through the `AdvancedBotDetection` module:
   `AdvancedBotDetection.bot? 'your user agent string'`

3. Through a `AdvancedBotDetection::Test` instance:
   `AdvancedBotDetection::Test.new('your user agent string').bot?`

All of the above examples accept `human?`, `bot?`,`mobile?`, `phone?`,`tablet?`, `browser?`, `checker?`, `downloader?`, `proxy?`, `crawler?` and `spam?` methods. All of these methods will return `true`, `false`, or `nil` (if it doesn't recognize the user agent).

FAQ
===
__Q:__ __My browser isn't being matched__

__A:__ The current list is being pulled from [user-agents.org](http://www.user-agents.org), [PHP Mobile Detect](https://github.com/serbanghita/Mobile-Detect) and [my own list](https://github.com/usbsnowcrash/advanced-bot-detection/blob/master/custom-add-ons.yml)
If you'd  like to have entries added to the list please [create a new issue](https://github.com/usbsnowcrash/advanced-bot-detection/issues/new) or send me a [pull request](https://github.com/usbsnowcrash/advanced-bot-detection/pulls). And if you know of a better source for this sort of data, please [let me know](mailto:jeffery.yeary@gmail.com).


RUNNING TESTS?
=============

  * bundle install
  * rake
  * rake test #code tests
  * rake spec #app tests

