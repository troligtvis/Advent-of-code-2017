
def getInput()
	return File.read('input.txt').split(',').map { |e| e.to_i }
end

input = getInput()

skipSize = 0
cPos = 0
lengths = input
elements = (0..255).to_a

for length in lengths
	if length < elements.size + 1
		temp = []
		for n in 0...length 
			cIdx = (n + cPos) % elements.size
			temp[n] = elements[cIdx]
		end

		temp = temp.reverse

		for n in 0...length 
			cIdx = (n + cPos) % elements.size
			elements[cIdx] = temp[n]	
		end
	end

	cPos = (length + cPos + skipSize) % elements.size
	skipSize += 1
end

puts elements[0] * elements[1]