def getInput()
	content = File.readlines('input.txt')
	return content.map { |e|  e.split(' ')[0] }
end

def part1() 
	raw = File.read('input.txt')
	keys = getInput()
	
	root = ''
	for key in keys 
		m = raw.scan(/\b#{key}\b/).size
		if m == 1 
			root = key
		end
	end

	puts root
end

part1()