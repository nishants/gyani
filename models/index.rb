# create a model
class Index < ActiveRecord::Base
	self.table_name = "index"
	
	# keywords must be in order
	def self.put page, keywords
		keywords.each_with_index{|keyword, index|
			Index.create(
				:page_id => page.id,
				:keyword_id => keyword.id,
				:rank => index)
		}
	end

	def self.mappings_for keywords
    key_ids = keywords.map{|key| key.id}
		Index.where(:keyword_id => key_ids)
	end	
end
