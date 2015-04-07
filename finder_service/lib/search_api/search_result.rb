class SearchResult
  def self.with page_ids
    SearchResult.new(page_ids)
  end

	def initialize page_ids
    @result = Page.find_by_id_in(page_ids)
	end

	def top pages_count
    @result.slice(0, pages_count)
	end	
end