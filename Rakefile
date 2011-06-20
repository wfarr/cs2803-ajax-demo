require_relative "lib/demo/init"
require "rake/testtask"

desc "Load stuff in IRB."
task :console => :environment do
  exec "irb -Ilib -rdemo"
end

task :environment do
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "db/demo.sqlite3"
  )
end

namespace :db do
  require 'logger'
  require_relative "lib/demo/models"
  task :migrate => :environment do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
  task :rollback => :environment do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.rollback("db/migrate", 1)
  end
  task :seed => :environment do
    load File.join(File.dirname(__FILE__), 'db/seeds.rb')
  end
end