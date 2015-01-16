require 'bundler/gem_tasks'

desc 'Run tests'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)


desc 'Default task'
task :default do
  require_relative 'lib/profitrolly'

  options = JSON.parse File.open('keys.json', 'r'){ |file| file.read }
  token  = options['token']

  client = Profitrolly::Client.new(
      token: token
  )

  puts 'Activate promocode:'
  p client.activate(code: 'PROMO')

end
