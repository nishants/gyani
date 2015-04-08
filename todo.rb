TODO
0. why to consider max weight at all.
-1. KeyMap can be called as Index
2. create a client.
3. create search by keywords.
5. remove all semicolons
6. separate settings for test and development.
7. create migrations.
8. add modules for all classes.
9.corrent indentation to two tabs in all files.
10. add tests for model.
11. return create/ok(id exists) for indexing a page.
13. change the test for indexer_service#create_page_spec(only rest, okay for existing, created for new)
	also return craeted page in response.
14. write integration tests.
15. something is fishy, why KeyMap.put is put on singular ?? -> should be Index.add rather

Done
1. separate out model as gem.
4. correct the page creation, with using the KeywordsPage.
12. rename key_maps table to key_map
16. move search models to finder_api

------------------------
pageIndices = PageIndex.with_one_or_more_of(keywords)
pages = PageIndex.to_pages(pageIndices)

key_index_on_page 	= pageIndex.index_of(key)
query 

def apply_on query,  pageIndices
	sortedPageIndices = pageIndices.sort{|pageIndex|
		search_weight(query,  pageIndex)
	}
	PageIndex.to_pages(sortedPageIndices)
end

def search_weight query, pageIndex
	result = 0
	query.each{|key|
		result += (weight_for(key, query, pageIndex))
	}
	result
end


def weight_for(key, query, pageIndex)
	weight_on_page 		= (@max_weight - pageIndex.index_of(key))
	weight_in_query 	= (@max_weight - query.index(key))
	weight_in_search 	= weight_on_page * weight_in_query
end

------------------------


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





