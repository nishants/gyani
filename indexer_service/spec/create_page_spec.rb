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

      Keyword.find_by_text("online").should_not be_nil
      Keyword.find_by_text("shopping").should_not be_nil
      Keyword.find_by_text("review").should_not be_nil

      Page.find_by_url("www.snapdeal.com").should_not be_nil;
      Page.find_by_url("www.flipkart.com").should_not be_nil;;
    end
  end
end
