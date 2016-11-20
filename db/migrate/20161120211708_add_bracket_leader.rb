class AddBracketLeader < ActiveRecord::Migration[5.0]
  def change
    add_column :brackets, :admin, :integer
  end
end
