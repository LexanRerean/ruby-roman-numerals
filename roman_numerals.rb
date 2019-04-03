class Fixnum
	def to_roman
		result = ''
		array = self.to_s.split('')
		digitOrder = 1
		array.reverse_each do |digit|
			result = digit_to_roman(digit, digitOrder) + result
			digitOrder += 1
		end
		result
	end

	def digit_to_roman_letter(digit, letters)
		digitInt = digit.to_i
		if digitInt < 4
			result = ''
			while digitInt > 0
				digitInt -=1
				result += letters[0]
			end
			result
		elsif digitInt == 4
			letters[0] + letters[1]
		elsif digitInt < 9
			result = letters[1]
			while digitInt > 5
				digitInt -=1
				result += letters[0]
			end
			result
		else
			letters[0] + letters [2]
		end
	end

	def digit_to_roman(digit, digitOrder)
		if digit == '0'
			''
		elsif digitOrder == 1
			digit_to_roman_letter(digit, ['I', 'V', 'X'])
		elsif digitOrder == 2
			digit_to_roman_letter(digit, ['X', 'L', 'C'])
		elsif digitOrder == 3
			digit_to_roman_letter(digit, ['C', 'D', 'M'])
		elsif digitOrder == 4
			if digit == '1'
				'M'
			elsif digit == '2'
				'MM'
			elsif digit == '3'
				'MMM'
			end	
		end
	end
end