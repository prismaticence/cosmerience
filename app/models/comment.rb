class Comment < ActiveRecord::Base
	belongs_to :review
	belongs_to :user
	has_ancestry
end