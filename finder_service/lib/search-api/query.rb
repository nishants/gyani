class Query
  @@MAXIMUM_KEYWORDS_PER_PAGE = 8
  @key_weights = {}
  attr_accessor :key_weights

  def select page_ranks
    page_ranks.sort{|pageOne, pageTwo|
      weight_of(pageOne) <=> weight_of(pageTwo)
    }
  end

  def weight_of page_rank
    weight = 0;
    page_rank.key_weights.each{|key, weight_in_page|
      weight_in_query = @key_weights[key]
      weight += ( weight_in_page * (weight_in_query.nil? ? 0 : weight_in_query))
    }
    weight
  end  

  def initialize key_weights
    @key_weights = key_weights
  end

  def self.create keywords
    key_weights = {}
    keywords.each_with_index{|keyword, index|
      key_weights[keyword.id] = @@MAXIMUM_KEYWORDS_PER_PAGE - index
    }
    Query.new(key_weights)
  end
end
