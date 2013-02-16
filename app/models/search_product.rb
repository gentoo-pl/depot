# Nie dziala

class SearchProduct 
	def initialize(params)
		@result = Product.search do
	      fulltext ActiveSupport::Inflector.transliterate(params[:search]).downcase # szukam bez polskich znakow, wiecej info w modelu
	      with(:published_at).less_than(Time.zone.now)   #tylko opublikowane
	      facet(:publish_month) #tworzy podgrupy wyszukiwania 
	      with(:publish_month, params[:month]) if params[:month].present?
	    end
	    @result.results
	end

	
end