TODO
0. why to consider max weight at all.
2. create a client.
3. create search by keywords.
5. remove all semicolons
6. separate settings for test and development.
7. create migrations.
8. add modules for all classes.
9.corrent indentation to two tabs in all files.
10. add tests for model.
11. return create/ok(id exists) for indexing a page.
12. rename key_maps table to key_map
13. change the test for indexer_service#create_page_spec(only rest, okay for existing, created for new)
	also return craeted page in response.
14. write integration tests.
15. something is fishy, why KeyMap.put is put on singular ??
16. move search models to finder_api

Done
1. separate out model as gem.
4. correct the page creation, with using the KeywordsPage.


Issues :
	how many keywords possible ? including all non-english can be huge !!
	models as gems.



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





