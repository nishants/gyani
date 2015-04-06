1. separate out model as gem.
2. create a client.
3. create search by keywords.
4. correct the page creation, with using the KeywordsPage.
5. remove all semicolons
6. separate settings for test and development.
7. create migrations.
8. add modules for all classes.









 ENV['RACK_ENV'] = 'development'
 require './config/setup'

 page = Page.new(:url => 'geeksaints.org');
 key = Keyword.create(:text => 'vision');
 page.keywords.push(key);
 page.save()
 
 //KeywordsPage

Create a page like : 
	page = Page.create(:url => 'www.snapdeal.com')
	key = Keyword.create(:text => 'online')
	KeywordsPage.create(:page_id => page.id, :keyword_id => key.id, :rank => 3)





