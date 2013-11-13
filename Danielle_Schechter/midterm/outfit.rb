require_relative 'city.rb'

class Outfit
  	CHOICES = {
  		"Partly Cloudy" => "Umbrella",
        "Snow" => "Rain Boots",
        "Clear" => "Whatever You want dude"
    }

	attr_accessor :conditions, :weekday, :month, :day
	def initialize conditions, weekday, month, day
		@conditions = conditions
		@weekday = weekday
		@month = month
		@day = day
		# outfit_choices = hash.new
	
	end

	# def what_to_wear #outfit based on conditions
	# 	if "#{@conditions}" == "Partly Cloudy"
	# 		puts "Suggested Outfit: umbrella"
	# 	elsif "#{@conditions}" == "Chance of Rain"
	# 		puts "Outfit: rain boots"
	# 	else
	# 		puts "Outfit: whatevs"	
	# 	end
	# end


	def info #overrites default Ruby to_s method
		puts "#{@weekday}, #{@month} #{@day} "	
	 	puts "Condition: #{@conditions}"
	    # what_to_wear
	    puts clothes
	    puts

  	end

  	def clothes
  		if CHOICES[@conditions].nil?
  			puts "Outfit: Just go nude"
  		else
  			puts "Outfit:" 
  			CHOICES[@conditions]
  		end
  	end



# outfit_choices.each do|condition,outfit|
#   if "#{@conditions}" == "#{condition}
#   puts "outfit: #{outfit}"
# end
end






