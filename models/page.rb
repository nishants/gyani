# create a model
class Page < ActiveRecord::Base
	belongs_to :key_map

	def self.add url
		Page.create(:url => url)
	end
	
	def self.find_by_url url
		Page.where(:url => url).first
	end	

	def self.find_by_id_in page_ids
		Page.where(:id => page_ids)
	end	
end
