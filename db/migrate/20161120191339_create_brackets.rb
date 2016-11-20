class CreateBrackets < ActiveRecord::Migration[5.0]
  def change
    create_table :brackets do |t|
      t.string :game_name
      t.string :description
      t.timestamps
    end
  end
end
