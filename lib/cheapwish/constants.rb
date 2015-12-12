require 'sequel'

module Cheapwish
  module Paths
    RootConf = File.join(ENV['HOME'], '.config', 'cheapwish')
    DataDir = File.join(RootConf, 'data')
    DatabaseName = File.join(DataDir, 'db')

    Db = Sequel.connect("sqlite://#{DatabaseName}")
  end
end
