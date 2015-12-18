require 'cheapwish'

require 'yaml'

module Cheapwish
  # Main thing that will go over 
  # @author psyomn
  class Controller
    include Paths
    def run
      usr = get_user
      scraper = Scraper.new(usr)
      scraper.scrape
    end

    def set_user(user)
      File.open(Settings, 'w') { |ff| ff.write(YAML::dump({user: user})) }
    end

    def get_user
      YAML::load(load_settings)[:user]
    end

    private

    def load_settings
      contents = File.open(Settings, 'r') { |ff| ff.read }
    rescue Errno::ENOENT
      puts "You need to set a user with -u".red.bold
      exit
    end
  end
end
