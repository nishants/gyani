require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
    Keyword.delete_all
    @online      = Keyword.create(text: "online");
    @shopping    = Keyword.create(text: "shopping");

    @page = Page.create(
        :url => "www.snapdeal.com",
        :keywords => [@online, @shopping])
  end
  
  context "Fetch pages" do
    it 'should fetch page and tokenize keywords' do
      page = Page.all[0];
      page.url.should == 'www.snapdeal.com';
      page.keywords.should == [@online, @shopping];      
    end
  end
end
