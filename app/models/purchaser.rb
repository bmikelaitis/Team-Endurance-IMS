class Purchaser < ActiveRecord::Base
	#belongs_to :receipts
	has_many :receipts
	validates :purchaser_name, presence: true, length: { minimum: 2, maximum: 30 }
	validates :worker_category, presence: true, length: { minimum: 2, maximum: 30 }	


end