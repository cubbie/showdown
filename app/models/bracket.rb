class Bracket < ApplicationRecord

  def info
    return ["#{self.game_name}", "#{self.description}", "#{self.admin}"]
  end

end
