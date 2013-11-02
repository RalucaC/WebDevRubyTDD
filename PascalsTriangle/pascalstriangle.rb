def compute_row(n)
	
	if n.class == String
		return nil
	end
	if n == 1
		return [1]
	end
	if n == 2
		return [1,1]
	end

	ary = [1,1]
		
	while n > 2
		aryAux = []
		i = 0 		
		while i < ary.size
			if i == 0
				aryAux.push(ary[i])
				i = i + 1
			else
				aryAux << ary[i - 1] + ary[i]
				
				if i == ary.size - 1
					aryAux.push(ary[i])
				end
				
				i = i + 1
			end
		end
		ary = aryAux.compact
 		n = n - 1	
		
	end

	return aryAux	
end
