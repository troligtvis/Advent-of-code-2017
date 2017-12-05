def readInput() 
	content = File.readlines('input.txt').map { |line| line.to_i }
	return content
end

def part1()
	jumps = readInput()
	totalJumps = 0 
	i = 0
	
	until jumps[i] == nil do 
		totalJumps += 1
		jump = jumps[i]

		
		jumps[i] += 1
		i += jump
	end

	puts 'Solution: ' + totalJumps.to_s
end

def part2()
	jumps = readInput()
	totalJumps = 0 
	i = 0

	until jumps[i] == nil do 
		totalJumps += 1
		jump = jumps[i]

		if jump >= 3
			jumps[i] -= 1
		else
			jumps[i] += 1
		end	

		i += jump
	end

	puts 'Solution: ' + totalJumps.to_s 
end

part1() # 356945
part2() # 28372145