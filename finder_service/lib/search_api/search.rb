class Search
  def self.for keywords
    keyword_ids = keywords.map{|keyword| keyword.id}
    mappings_for_keys = KeyMap.mappings_for(keyword_ids)

    Search.new(keyword_ids, page_wise(mappings_for_keys))
  end

  def self.page_wise mappings
    result = {}
    mappings.each{|key_map|
      result[key_map.page_id] = [] unless result[key_map.page_id]
      result[key_map.page_id].push(key_map.keyword_id)
    }
    result
  end

  def initialize key_ids, key_ids_on_pages
   @key_ids = key_ids
	 @key_ids_on_pages = key_ids_on_pages
  end

  def select_by search_function
    page_ids = search_function.apply_on(@key_ids, @key_ids_on_pages)
    SearchResult.with(page_ids)
  end
end
