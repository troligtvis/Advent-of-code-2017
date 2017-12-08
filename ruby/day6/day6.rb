def readInput() 
	content = File.read('input.txt')
	return content.split('	').map { |s| s.to_i }
end

testInput = [0, 2, 7, 0]

runs = []
isFound = false

cycles = 0
input = readInput()

until isFound do
	cycles += 1
	indexForMax = input.index(input.max)
	numbers = input[indexForMax]
	input[indexForMax] = 0

	for i in 0...numbers
		input[(i + indexForMax + 1) % input.count] += 1
	end

	for run in runs
		isFound = (input <=> run) == 0
		if isFound 
			puts 'block cycle: ' + (runs.count - runs.index(run)).to_s
			break

		end
	end

	if !isFound 
		runs.push(input.dup)
	end 
end

puts cycles