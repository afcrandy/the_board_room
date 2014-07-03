class RemoveIndexReviewsOnAuthorIdAndCreatedAt < ActiveRecord::Migration
	def change
		remove_index :reviews, column: [:author_id, :created_at]
	end
end
