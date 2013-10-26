def classify_poker_hand(poker_hand)
	
	if poker_hand == {}
		return :not_a_ruby_array
	end
	for i in poker_hand
		if (i.is_a? Integer) == false
			return :at_least_one_card_is_not_an_integer
		end 
	end
	if poker_hand.size != 5	
		return :too_many_or_too_few_cards
	end
	sorted_poker_hand = poker_hand.sort
	i = 0
	high_card = 1
	pairs = Hash.new
	for i in sorted_poker_hand
				
		if i > 1000
			return :at_least_one_card_is_out_of_bounds
		end
		
			
		if pairs.has_key?(i)
			pairs[i] += 1
		else
			pairs[i] = 1
		end
	end
	

		
	i = 0
	puts(pairs.to_s)
	high_card_max = 0
	while i < sorted_poker_hand.size - 1 
		val1 = sorted_poker_hand[i]
		val2 =  sorted_poker_hand[i + 1]
		val2 = val2 - 1
		
		if val1 == val2
			high_card += 1
		else
			high_card_max = high_card
			high_card = 1	
		end
			
			
		
		i = i + 1	  
	end

	if pairs.values.count(3) == 1 and pairs.values.count(2) == 1
		return :full_house	
	end
	if pairs.values.count(5) == 1
		return :impossible_hand
	end
	if pairs.values.count(4) == 1
		return :four_of_a_kind
	end 
	
	if pairs.values.count(2) == 2
		return :two_pairs
	end
		
	if pairs.values.count(2) == 1
		return :one_pair
	end

	if pairs.values.count(3) == 1
		return :three_of_a_kind
	end	
		
	puts("high="+high_card.to_s)
	if high_card > high_card_max
		aux = high_card_max		
		high_card_max = high_card
		high_card = aux
	end
	if high_card_max == 5
		return :straight
	end		
		
	if high_card_max >= 3 and high_card_max < 5
		return :high_card 
	end

	return :valid_but_nothing_special
end


