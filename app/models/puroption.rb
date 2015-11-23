class Puroption < ActiveRecord::Base
	#belongs_to :receipts
	has_many :receipts
	validates :puroption_name, presence: true, length: { minimum: 2, maximum: 30 }
	validates :description, presence: true, length: { minimum: 2, maximum: 200 }


	
end