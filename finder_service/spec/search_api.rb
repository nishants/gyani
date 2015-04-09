require "spec_helper"

describe Application do

  context "Search API" do
    
    it "Should sort page_ids by strenght of match" do
      Page.delete_all;
      Keyword.delete_all;
      KeyMap.delete_all;

      online      = Keyword.add("online")
      shopping    = Keyword.add("shopping")
      clothing    = Keyword.add("clothing")
      apparels    = Keyword.add("apparels")
      clothing    = Keyword.add("clothing")
      india       = Keyword.add("india")

      snapdeal  = Page.add("www.snapdeal.com")
      myntra    = Page.add("www.myntra.com")
      flipkart  = Page.add("www.flipkart.com")
      amazon    = Page.add("www.amazon.com")   

      KeyMap.put( snapdeal,  [online,   shopping      ])
      KeyMap.put( flipkart,  [shopping, online        ])
      KeyMap.put( myntra,    [online                  ])
      KeyMap.put( amazon,    [clothing,india,apparels ])

      max_keys = 8

      keywords_in_query = [shopping, online]
      pageIndices = PageIndex.indexes_containing(keywords_in_query)

      result = SearchResult.with(QueryWeightFunction.with_max_weight(max_keys)
      			.for(keywords_in_query)
      			.apply_on(pageIndices))
          
      result.top(3)== [flipkart, snapdeal, myntra]
      result.top(1)== [flipkart]
      result.top(2)== [flipkart, snapdeal]
    end

  end
end