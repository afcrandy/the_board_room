class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :website
      t.integer :genre_id

      t.timestamps
      t.index :name, unique: true
    end
  end
end
