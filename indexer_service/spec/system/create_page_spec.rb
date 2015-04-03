require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
  end

  context "Sample test" do
    it "should return ok" do
      put "/pages", {url: "www.geeksaint.com", keywords: "Ford, Car, Review" }
      last_response.status.should == 200
      created_page = Page.all()[0]
      created_page.url.should == "www.geeksaint.com"
      created_page.keywords.should == "Ford, Car, Review"
    end
  end
end
