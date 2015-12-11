require 'cheapwish'
require 'sequel'
require 'sequel/extensions/migration'

module Cheapwish
  class Boot
    include Paths

    # Dump all bootstraping things in here
    def self.strap
      Boot.make_dirs
      Boot.make_database
      nil
    end

    def self.make_dirs
      FileUtils.mkdir_p [RootConf, DataDir]
      nil
    end

    def self.make_database
      path = File.join(File.expand_path(File.dirname(__FILE__)), 'sql', 'migrations')
      Sequel::Migration.apply(Constants::Db, path)
      nil
    end

  end
end

