class ChangeColumnDefaultUsers < ActiveRecord::Migration[5.2]
  def up
    change_column_default(:users, :username, 0)
  end

  def down
    change_column_default(:users, :username, nil)
  end
end
