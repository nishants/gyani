require "spec_helper"

describe Application do

  context "Page Index" do
    
    it "Should return page indexes for keywords" do
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

	    KeyMap.put( snapdeal,  [online,   shopping	    ])
	    KeyMap.put( flipkart,  [shopping, online	      ])
	    KeyMap.put( myntra,    [online			            ])
	    KeyMap.put( amazon,    [clothing,india,apparels ])

      PageIndex.indexes_containing([shopping, online]).length.should == 3
      PageIndex.indexes_containing([shopping]).length.should == 2
      PageIndex.indexes_containing([clothing]).length.should == 1

      amazon_index = PageIndex.indexes_containing([clothing]).first

      amazon_index.index_of(clothing).should  == 0
      amazon_index.index_of(shopping).should be_nil

      # a keywords not in query, is nil
      amazon_index.index_of(apparels).should be_nil
    end

  end
end