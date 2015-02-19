require "bundler/gem_tasks"
require 'slackbot'

def groups
  { 
    "lunch" => "G029RFQA6",
    "technical-discussion" => "G029RL5PQ",
    "watercooler" => "G029CMT1P"
  }
end

task :slackbot_chat do
  Slackbot.setup(groups['lunch'], :group, [Slackbot::Strategy::Hungry])
  chat = Slackbot::Chatter.new
  chat.run
end

task :lint do
  Slackbot.setup(groups['technical-discussion'], :group, [Slackbot::Strategy::Linter])
  chat = Slackbot::Chatter.new
  chat.run
end
