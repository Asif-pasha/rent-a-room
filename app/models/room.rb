class Room < ActiveRecord::Base
	
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms
	has_many :bookings
	has_many :special_prices
	has_many :reviews
	
	
	belongs_to :city
	belongs_to :user	
	before_save :determine_latitude_and_longitude
	after_create :change_role
	mount_uploader :image, ImageUploader
	after_update :authorize_confirm

			validates_presence_of :name, :description, :price, :rules, :address, :image,  :city_id, :user_id
	validates_numericality_of :price, :city_id, :user_id
	validates_processing_of :image
			#validates_processing_of :image
#validate :image_size_validation
	#validates_presence_of :name, :description, :price,:rules,:address,:city_id,:user_id
	def determine_latitude_and_longitude
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}&key=AIzaSyBDBSV9LOvH-VYy2k4YkZ4jhjInjs6d74s")
		self.latitude = response["results"][0]["geometry"]["location"]["lat"]
		self.longitude = response["results"][0]["geometry"]["location"]["lng"]

	end
	def change_role
		if self.user.role.name == "Guest"
					
			self.user.update_attributes(role_id: Role.second.id)
		
		end
	end
	def authorize_confirm
		if self.is_authorized == true
			Notification.room_added(self).deliver_now!
		end
	end
private
 # def image_size_validation
  #  errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  #end
end
