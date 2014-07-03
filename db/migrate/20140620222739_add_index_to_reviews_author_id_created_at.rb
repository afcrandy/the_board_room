class AddIndexToReviewsAuthorIdCreatedAt < ActiveRecord::Migration
	def change
		add_index :reviews, [:author_id, :created_at]
		add_index :reviews, [:game_id, :author_id], unique: true
	end
end
