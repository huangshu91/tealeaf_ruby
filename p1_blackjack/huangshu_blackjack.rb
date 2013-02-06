class Card
	def initialize()
		@suits = ["hearts", "spades", "diamonds", "clubs"]
		@val = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]
		@suits_size = 4
		@val_size = 13
		@num_ace = 0
	end

	def draw_card()
		drawn_suit = rand(@suits_size)
		@drawn_val = rand(@val_size)
		card = @val[@drawn_val] +" of "+ @suits[drawn_suit]
	end

	def get_value()
		return @drawn_val+1
	end
end

#main game loop
while true do
	num_ace = 0
	hand_val = 0
	drawn_suit = 0
	drawn_val = 0
	cur_drawn = Hash.new
	i = 0
	deck = Card.new
	
	#loop for an individual hand
	while true do
		cur_card = deck.draw_card()
		while (cur_drawn.has_key?(cur_card)) do
			cur_card = deck.draw_card()
		end

		i += 1
		
		cur_drawn[cur_card] = 1
		puts "#{cur_card}"

		if (deck.get_value() == 1)
			num_ace += 1
			hand_val += 11
		elsif (deck.get_value() > 9)
			hand_val += 10
		else 
			hand_val += deck.get_value()
		end

		input = 0

		if (hand_val > 21 && num_ace > 0)
			hand_val -= 10
			num_ace -= 1
		end

		if (hand_val > 21) 
			puts "bust with value #{hand_val}"
			puts ""
			break
		elsif (hand_val == 21)
			puts "blackjack"
			puts
			break
		end

		if (i > 1)
			puts "#{hand_val}" 
			while true do
				puts "1 to hit, 2 to stay"
				input = gets.chomp
				if (input == "1" || input == "2")
					break
				end
			end
		end

		if (input == "2")
			puts "your total value was #{hand_val}"
			break
		end
	
	end
end