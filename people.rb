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

chris = Instructor.new(Chris)
chris.greeting

christina = Student.new(Christina)
christina.greeting