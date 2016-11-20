class AddStatusToBracket < ActiveRecord::Migration[5.0]
  def change

    add_column :brackets, :started, :boolean
  end
end
