class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	#default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 350 }
end
