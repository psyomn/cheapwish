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
      Sequel::Migrator.apply(Db, MigrationsDir)
      nil
    end

  end
end

