class Receipt < ActiveRecord::Base 
    belongs_to :user
    belongs_to :puroption
    belongs_to :purchaser
    belongs_to :vendor
    belongs_to :department
    belongs_to :subject
    has_many :images, :inverse_of => :receipt, :dependent => :destroy
    accepts_nested_attributes_for :images, allow_destroy: true
    validates :user_id, presence:true
    validates :descript, presence: true, length: { minimum: 4, maximum: 120 }
    before_save :tax_amount
    before_save :purchase_amount
    validates :tax_amount, presence:true
    validates :purchase_amount, presence:true
    
    
    def tax_amount=(num)
        num.gsub!('$','') if num.is_a?(String)
        num.gsub!(',','') if num.is_a?(String)
        self[:tax_amount] = num.to_f
    end
    def purchase_amount=(num)
        num.gsub!('$','') if num.is_a?(String)
        num.gsub!(',','') if num.is_a?(String)
        self[:purchase_amount] = num.to_f
    end



end