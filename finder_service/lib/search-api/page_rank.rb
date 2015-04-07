class PageRank
	@@MAXIMUM_KEYWORDS_PER_PAGE = 8

	@page_id = nil
	@key_weights = []

	attr_accessor :page_id
	attr_accessor :key_weights

	def self.create page_id, ordered_keywords_ids
		page_id = page_id
		keywords_weights = {}

		ordered_keywords_ids.each_with_index{ |key_id, index|
			keywords_weights[key_id] = @@MAXIMUM_KEYWORDS_PER_PAGE - index
		}
		pageRank = PageRank.new()
		pageRank.page_id = page_id
		pageRank.key_weights = keywords_weights
		pageRank
	end

	def self.ranks_for mappings						
		result = {}
		mappings.each{|key_map|
			result[key_map.page_id] = [] unless result[key_map.page_id]
			result[key_map.page_id].push(key_map.keyword_id)
		}
		page_ranks = []
		result.each{|key, value|
			page_ranks.push(PageRank.create(key, value))
		}
		page_ranks
	end	
end