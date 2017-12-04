
def getInput()
	content = File.read('input.txt')
	return content.split('').map { |s| s.to_i }
end

def captcha(numbers, part) 
	sum = 0
	for i in (0..numbers.count - 1)
		value = numbers[i]
		nextValue = part == 1 ? numbers[(i + 1) % numbers.count] : numbers[(i + numbers.count / 2) % numbers.count]
		sum += value == nextValue ? value : 0
	end
	puts 'Solution: ' + sum.to_s
end

numbers = getInput
captcha(numbers, 1)
captcha(numbers, 2)
