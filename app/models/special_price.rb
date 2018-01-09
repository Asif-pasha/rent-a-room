class SpecialPrice < ActiveRecord::Base
	belongs_to :room
	validate :correct_date ,on: :create
	validate :check_specialdateexist, on: :create
		def correct_date
			if self.start_date < Date.today
				self.errors.add(:start_date ,"Your date should not be less than current date")
			end
			if (self.end_date <self.start_date)
				self.errors.add(:end_date ,"Your end_date cannot be less than start_date")
			end
		end
		def check_specialdateexist
			current_date =(self.start_date..self.end_date).to_a
			special_date = SpecialPrice.where('room_id=?',self.room_id)
			special_date.each do |sdate|
				special_date =(sdate.start_date..sdate.end_date).to_a
				current_date.each do |date|
					if special_date.include?(date)
						self.errors.add(:base, "This date already has a special_price")
						break
					end	
				end
			end
		end

end

