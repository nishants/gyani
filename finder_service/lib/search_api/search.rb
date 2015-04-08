class Search
  @@MAX_KEYWORDS = 8
  
  def self.search_for keywords_in_query
    pageIndices = PageIndex.indexes_containing(keywords_in_query)
    PageIndex.to_pages(QueryWeightFunction.with_max_weight(@@MAX_KEYWORDS).for(keywords_in_query).apply_on(pageIndices))
  end
end
