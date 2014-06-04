class People
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def greeting
		"Hi, my name is #{@name}"
	end
end

class Student < People
	def learn
		"I get it!"
	end
end

class Instructor < People
	def teach
		"Everything in Ruby is an Object"
	end
end

chris = Instructor.new("Chris")
puts chris.greeting

christina = Student.new("Christina")
puts christina.greeting

puts chris.teach
puts christina.learn

# cannot call christina.teach because this is an instance method of the instructor class and christina is an instance of the student class
