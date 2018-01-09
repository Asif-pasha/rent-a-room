class AmenityRoom < ActiveRecord::Base
	belongs_to :room
	belongs_to :user
	belongs_to :amenity

end
