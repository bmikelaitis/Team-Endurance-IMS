class Department < ActiveRecord::Base
	#belongs_to :receipts
	has_many :receipts
	validates :department_name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :department_description, presence: true, length: { minimum: 2, maximum: 400 }	


end