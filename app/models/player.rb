class Player < ApplicationRecord
  before_save :capitalizename

  def capitalizename
    self.firstname.capitalize!
    self.lastname.capitalize!
  end

end
