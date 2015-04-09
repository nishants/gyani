class SearchResult
  def self.with page_indices
    SearchResult.new(page_indices)
  end

	def initialize page_indices
    	@result = page_indices
	end

	def top pages_count
    	PageIndex.to_pages(@result).slice(0, pages_count)
	end	
end