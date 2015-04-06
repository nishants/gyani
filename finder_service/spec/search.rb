require "spec_helper"

describe Application do

  before :each do
    Page.delete_all;
    Keyword.delete_all;

    online      = Keyword.add("online")
    shopping    = Keyword.add("shopping")
    reviews     = Keyword.add("reviews")
    clothes     = Keyword.add("clothes")
    apparels    = Keyword.add("apparels")

    @snapdeal_page  = Page.add("www.snapdeal.com")
    @myntra_page    = Page.add("www.myntra.com")
    @flipkart_page  = Page.add("www.flipkart.com")
    @amazon_page    = Page.add("www.amazon.com")    
  end

  def to_urls pages_json
    JSON.parse(pages_json).map {|page| page["url"] }
  end

  context "Should fetch result by keywords" do
    it "should return ok" do
      get "/search", :query => "online, shopping"

      to_urls(last_response.body).should == [
        "www.snapdeal.com",
        "www.flipkart.com",
        "www.amazon.com",
        "www.myntra.com"
      ]
    end

  end
end