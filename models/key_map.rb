# create a model
class KeyMap < ActiveRecord::Base
	belongs_to :keyword
	belongs_to :page

	# keywords must be in order
	def self.add page, keywrods

	end
end
