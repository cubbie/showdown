class AddRoundToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :round, :integer
  end
end
