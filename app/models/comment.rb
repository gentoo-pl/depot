class Comment < ActiveRecord::Base
  attr_accessible :content, :product_id, :rate
  belongs_to :product

  RATES = (1..5).to_a

  validates :rate, :inclusion => { :in => RATES, :message => "out of range", :allow_blank => true }
end
