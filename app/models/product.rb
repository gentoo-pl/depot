#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class Product < ActiveRecord::Base
  attr_accessible :title, :description, :published_at, :comments_attributes ## accepts_nested_attributes_for powinno to zalatwic, a nie chce :/
  has_many :line_items
  has_many :comments
  accepts_nested_attributes_for :comments, reject_if: :all_blank ## Nie puszcza jesli probujesz zapisac pusty obj
  has_many :orders, through: :line_items


  #...

  scope :published, lambda { where('published_at <= ?', Time.zone.now )} ## Dzieki temu ze wsadzielm to w lambde w produkcyjnym bedzie wyszukiwac za kazdym razem

  before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
# 
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, length: {minimum: 10}



  searchable do 
    # text rozbija na słowa
    # string robi na pałę, szuka stałego stringa
    text :title, boost: 5 # tytul będzie 5x bardziej istotny od opisu
    text :description, :publish_month
    text :comments do
      comments.map(&:content) ## Alias : comments.map {|x| x.content }
    end
    time :published_at #tylko opublikowane
    string :publish_month
  end

  def publish_month
    published_at.strftime("%B %Y")
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
