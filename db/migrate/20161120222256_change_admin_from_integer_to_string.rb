class ChangeAdminFromIntegerToString < ActiveRecord::Migration[5.0]
  def change

    change_column :brackets, :admin, :string
  end
end
