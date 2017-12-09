
def getInput()
	return File.read('input.txt').split('')
end

def garbageCloseIndex(array, idx)
	startIdx = idx
	nonCancelCharCount = 0

	until array[idx] == '>' do 
		nextChar = array[idx]

		if nextChar == '!' 
			idx += 1
		end

		idx += 1

		if array[idx] != '!' && array[idx] != '>'
			nonCancelCharCount += 1
		end 
	end

	return idx, nonCancelCharCount
end

input = getInput()

idx = 0
openGroups = 0
score = 0
nonCancelChar = 0

until idx == input.count do
	char = input[idx] 
	case char
	when '{'
		openGroups += 1
	when '}'
		score += openGroups
		openGroups -= 1
	when '<'
		idx, count = garbageCloseIndex(input, idx)
		nonCancelChar += count
	when '!'
		idx += 1
	end

	idx += 1
end

puts 'Score: ' + score.to_s
puts 'Non Cancel Chars: ' + nonCancelChar.to_s