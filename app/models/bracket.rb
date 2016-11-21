class Bracket < ApplicationRecord
  has_many :relationships

  has_many :users, through: :relationships

  def info
    return ["#{self.game_name}", "#{self.description}", "#{self.admin}"]
  end



end
