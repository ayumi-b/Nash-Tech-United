class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :goal

      t.timestamps null: false
    end
  end
end
