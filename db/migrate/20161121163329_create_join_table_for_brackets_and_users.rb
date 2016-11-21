class CreateJoinTableForBracketsAndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships, id: false do |t|
      t.belongs_to :bracket, index: true
      t.belongs_to :user, index: true
    end
  end
end
