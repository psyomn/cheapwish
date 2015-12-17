module Cheapwish
  class Wishlist
    # @param user_id is the steam user id
    def initialize(user_id)
      @games = []
    end

    attr_accessor :games
  end
end
