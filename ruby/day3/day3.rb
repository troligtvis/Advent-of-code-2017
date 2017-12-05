input = 277678

def steps(n) 
	root = (Math.sqrt(n)).to_f.ceil
	side = root % 2 != 0 ? root : root + 1
	mid = (side - 1) / 2
	layer = n - ((side - 2) ** 2)
	innerOffset = layer % (side - 1)

	puts "root:" + root.to_s
	puts "side:" + side.to_s
	puts "mid:" + mid.to_s
	puts "layer:" + layer.to_s
	puts "innerOffset:" + innerOffset.to_s

	return mid + (innerOffset - mid).abs
end

puts(steps(input))