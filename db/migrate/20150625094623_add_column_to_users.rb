class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reason, :text
  end
end
