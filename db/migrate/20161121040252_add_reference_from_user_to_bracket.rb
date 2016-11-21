class AddReferenceFromUserToBracket < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :bracket, index: true
  end
end
