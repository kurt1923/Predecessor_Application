class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.string :hero
      t.string :title
      t.string :info
      t.integer :user_id
      t.integer :wins
      t.integer :losses
      t.boolean :favorites
      t.timestamps
    end
  end
end
