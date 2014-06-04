class Rover

	def initialize(x,y,orientation)
		@x = x
		@y = y
		@orientation = orientation
	end

	def instructions(str)
		 moves = str.split("")
		 moves.each do |move|
		 	if (move == "L") || (move == "R") 
		 		rotate(move)
		 	else
		 		forward
		 	end
		 end
		 puts "#{@x} #{@y} #{@orientation}"
	end

	def forward
		case @orientation
		when "N"
			@y += 1
		when "E"
			@x += 1
		when "W"
			@x -= 1
		when "S"
			@y -= 1
		end
	end


	def rotate(direction)
		directions = ["W","N","E","S"]

		if direction == "L"
			@orientation = directions[directions.index(@orientation) - 1]
		elsif direction == "R"
			@orientation = directions[directions.reverse.index(@orientation) - 1]
		end
		@orientation
	end
end

rover = Rover.new(1,2,"N")
rover.instructions("LMLMLMLMM")
