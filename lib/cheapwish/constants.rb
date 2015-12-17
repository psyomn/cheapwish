require 'sequel'

module Cheapwish
  module Paths
    RootConf = File.join(ENV['HOME'], '.config', 'cheapwish')
    DataDir = File.join(RootConf, 'data')
    DatabaseName = File.join(DataDir, 'db')
    MigrationsDir = File.join(
      File.expand_path(File.dirname(__FILE__)), 'migrations')

    Settings = File.join(RootConf, 'settings.yml')
    Db = Sequel.connect("sqlite://#{DatabaseName}")
  end
end
