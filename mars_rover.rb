class Plateau
	attr_reader :height, :width
	def initialize(height, width)
		@height = height
		@width = width
	end
end

class Rover
	def initialize(x,y,orientation,plateau)
		@x = x
		@y = y
		@orientation = orientation
		@plateau = plateau
	end

	def instructions(str)
		 str.each_char do |move|
		 	if move == 'M'
		 		forward
		 	else
		 		rotate(move)
		 	end
		 end
		 result
	end

	def result
		 if (0..@plateau.height).include?(@x) && (0..@plateau.width).include?(@y)
		 	puts "#{@x} #{@y} #{@orientation}" 
		 else
		 	puts "Rover has died"
		 end
	end

	def forward
		case @orientation
		when "N" then @y += 1
		when "E" then @x += 1
		when "W" then @x -= 1
		when "S" then @y -= 1
		end
	end


	def rotate(direction)
		directions = ["W","N","E","S"]

		directions.reverse! if direction == "R"
		@orientation = directions[directions.index(@orientation) - 1]
	end
end

mars = Plateau.new(5,5)

rover = Rover.new(1,2,"N",mars)
rover.instructions("LMLMLMLMM")

rover = Rover.new(8,9,"E",mars)
rover.instructions("MMRMMRMRRM")
