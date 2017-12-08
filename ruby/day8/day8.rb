
# b inc 5 if a > 1
# 0 1   2 3  4 5 6
# 0 : variable 		Int (start with 0)
# 1 : instruction 	(inc, dec)
# 2 : value 		Int
# 3 : 
# 4 : arg 1			 Int
# 5 : expression  	(<, >, ==, >=, <=, !=)
# 6 : arg 2			Int

def readInput(filename) 
 	return File.readlines(filename).map { |e| e.split(' ') }
end

def checkExpression(a, expression, b)
	case expression
	when '>'
		return a > b
	when '>='
		return a >= b
	when '<'
		return a < b
	when '<=' 
		return a <= b
	when '=='
		return a == b
	when '!='
		return a != b
	else 
		puts 'Failed exp: ' + expression
	end
end

def testInstructions()
	input = readInput('testInput.txt')
	largestValue, max = instructions(input)
	
	puts largestValue == 1 ? 'Test part 1 success' : 'Test part 1 failed'
	puts max == 10 ? 'Test part 2 success' : 'Test part 2 failed'
end

def instructions(lines) 
	keys = Hash[lines.map { |e| e[0] }.uniq.collect { |v| [v, 0]}]
	max = 0

	for line in lines 
		a = line[4]
		b = line[6]
		expression = line[5]
		if checkExpression(keys[a].to_i, expression, b.to_i) 
			instruction = line[1]
			value = line[2].to_i
			idx = line[0]
			case instruction 
			when 'inc'
				keys[idx] = keys[idx] + value
			when 'dec'
				keys[idx] = keys[idx] - value
			else 
				puts 'not valid instruction: ' + instruction
			end

			max = max > keys[idx] ? max : keys[idx]
		end
	end 

	return keys.values.max, max
end

testInstructions()
largestValue, max = instructions(readInput('input.txt'))
puts 'Solution part 1: ' + largestValue.to_s
puts 'Solution part 2: ' + max.to_s