class Booking < ActiveRecord::Base
	belongs_to :room
	belongs_to :user
	after_create :confirm_mail
	after_update :confirmroom
	validates_presence_of :start_date, :end_date, :user_id, :room_id
	validate :valueable_date, on: :create
	validate :check_dates, on: :create
	validate :booking_price_calculation, on: :create


	def valueable_date
		if self.start_date <  Date.today
			self.errors.add(:start_date, "Your start date should be greater then tadays date")
		end
		if (self.end_date < self.start_date)
			self.errors.add(:end_date ,"Your booking end_date must be greater than start_date")
		end

	end

	def check_dates
		n1 = self.start_date
		n2 = self.end_date

		now_booking = (n1..n2).to_a

		previous_booking = Booking.where('room_id=?', self.room_id)
		previous_booking.each do |pdate|
			n3 = pdate.start_date
			n4 = pdate.end_date

			all_previous_booking = (n3..n4).to_a

			now_booking.each do |date|
				if all_previous_booking.include?(date)
					self.errors.add(:base, "this room is already booked " )
					break
				end
			end
		end
	end
	def confirm_mail

			Notification.confirmmailhost(self).deliver_now!
			Notification.confirmmailguest(self).deliver_now!
	end
	def confirmroom
		if self.is_confirmed == true
			Notification.confirmroom(self).deliver_now!
		end
	end
	def booking_price_calculation
		current_booking = (self.start_date..self.end_date).to_a
		price = []

		special_bookings = SpecialPrice.where('room_id=?', self.room_id)
		
		special_bookings.each do |sdate|
			special_booking = (sdate.start_date..sdate.end_date).to_a

			if !(current_booking&special_booking).empty?
		
				price << (current_booking&special_booking).count * sdate.price
				current_booking -= special_booking
		
			end
		end

		if price.empty?
			special_booking_price = 0
		
		else
			special_booking_price = price.inject(:+)
		
		end

		normal_day_cost = (current_booking.length) * self.room.price
		self.price = (special_booking_price + normal_day_cost)
		


	end



end
