class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :first_team_id
      t.integer :second_team_id
      t.references :bracket
      t.timestamps
    end
  end
end
