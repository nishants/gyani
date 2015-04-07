class PageSearch
	def self.search_pages_with keywords
    mappings    = KeyMap.mappings_for(keywords)
    page_ranks  = PageRank.ranks_for(mappings)
    Query.create(keywords).select(page_ranks)
	end	
end
