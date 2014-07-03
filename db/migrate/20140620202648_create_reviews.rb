class CreateReviews < ActiveRecord::Migration
	def change
		create_table :reviews do |t|
			t.integer :author_id
			t.integer :game_id
			t.text :content

			t.timestamps
			t.index [:game_id, :created_at]
			t.index [:author_id, :created_at], unique: true
		end
	end
end
