class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.references :user, index: true, foreign_key: true
      t.string :goal

      t.timestamps null: false
    end
  end
end
