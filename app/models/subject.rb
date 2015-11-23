class Subject < ActiveRecord::Base

	has_many :receipts
	
	validates :subject_name, presence: true, length: { minimum: 2, maximum: 30 }
	validates :description, presence: true, length: { minimum: 2, maximum: 200 }

	
end