require 'bundler/gem_tasks'

desc 'Run tests'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)


desc 'Default task'
task :default do
  require_relative 'lib/profitrolly'

  options = JSON.parse File.open('keys.json', 'r'){ |file| file.read }
  token  = options['token']
  code = options['code']

  client = Profitrolly::Client.new(
      token: token
  )

  puts "Available promocode #{code}: "
  p client.available?(code)

  # puts "Activate promocode #{code}:"
  # p client.activate(code: code)

end
