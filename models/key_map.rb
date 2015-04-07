# create a model
class KeyMap < ActiveRecord::Base
	has_one :page
	has_one :keyword

	# keywords must be in order
	def self.put page, keywords
		keywords.each_with_index{|keyword, index|
			KeyMap.create(
				:page_id => page.id,
				:keyword_id => keyword.id,
				:rank => index)
		}
	end

	def self.mappings_for keywords_ids
		KeyMap.where(:keyword_id => keywords_ids)
	end	
end
