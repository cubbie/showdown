class Bracket < ApplicationRecord
  has_many :users

  def info
    return ["#{self.game_name}", "#{self.description}", "#{self.admin}"]
  end



end
