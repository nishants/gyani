class Search
  @@MAX_KEYWORDS = 8
  @@PAGE_SIZE = 5
  
  def self.search_for keywords_in_query    
    SearchResult.with(
    	QueryWeightFunction.with_max_weight(@@MAX_KEYWORDS)
    	.for(keywords_in_query)
    	.apply_on(
          PageIndex.indexes_containing(keywords_in_query)
      )
    ).top(@@PAGE_SIZE)
  end
end
