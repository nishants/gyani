require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
    Keyword.delete_all
  end
  
  context "Fetch pages" do

    it 'should fetch page and keywords' do
      put "/pages", {"url" =>"www.snapdeal.com", "keywords"=>["online", "shopping", "review"]}.to_json ;
      put "/pages", {"url" =>"www.flipkart.com", "keywords"=>["shopping", "review", "online"]}.to_json ;

      @online    = Keyword.where(text: "online").first;
      @shopping  = Keyword.where(text: "shopping").first;
      @review    = Keyword.where(text: "review").first;

      Page.where(url: "www.snapdeal.com").first.keywords.should == [@online , @shopping, @review];
      Page.where(url: "www.flipkart.com").first.keywords.should ==[@shopping, @review, @online];
    end
  end
end
