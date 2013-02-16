#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class StoreController < ApplicationController
	skip_before_filter :authorize, :search

  def index
    session[:visit_counter] ||= 0
    session[:visit_counter] += 1
    
    @products = Product.published.order(:title)
    @cart = current_cart
  end

  def search
  	@products = Product.where('title like ?', "%#{params[:title]}%")
    # @products = Product.search params[:title]
  	render :index
  end
end
