class Review < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	belongs_to :game

	validates :author_id, presence: true
	validates :content, presence: true, length: { maximum: 500 }
	validates_uniqueness_of :author_id, scope: :game_id
end
