class PageIndex
  attr_accessor :page_id

	def self.indexes_containing keywords
    indexes = Index.mappings_for(keywords)
    page_wise_indexes = group_by_page(indexes)
    page_indexes = []
    page_wise_indexes.each{|page, mappings|
      page_indexes.push(PageIndex.new(page, mappings))
    }
    page_indexes
  end

  def self.group_by_page indexes
    result = {}
    indexes.each{|key_map|
      result[key_map.page_id] = [] unless result[key_map.page_id]
      result[key_map.page_id].push(key_map)
    }
    result
  end

  def initialize page_id, mappings
    @page_id = page_id
    @keyword_ids  = {}    
    mappings.each{|mapping|
      @keyword_ids[mapping.keyword_id] = mapping.rank
    }
  end  

  def index_of keyword
    @keyword_ids[keyword.id]
  end

  def self.to_pages page_indices
    page_ids = page_indices.map{|page_index|
      Page.find_by_id(page_index.page_id) 
    }
    
  end  
end