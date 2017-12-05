def readInput() 
	content = File.readlines('input.txt').map { |line| line.to_i }
	return content
end

def jumping(part)
	jumps = readInput()
	totalJumps = 0
	i = 0

	until jumps[i] == nil do 
		totalJumps += 1
		jump = jumps[i]

		if part == 1 
			jumps[i] += 1
		else 
			jumps[i] += jump >= 3 ? -1 : 1
		end

		i += jump
	end

	puts 'Solution: ' + totalJumps.to_s 
end

jumping(1) # 356945
jumping(2) # 28372145