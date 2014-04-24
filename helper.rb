module Helper
	module ClassMethods
		def numeric?(n)
			n.to_i.to_s == n
		end

		def op?(n)
			(n == '*') || (n == '+')
		end		
	end
	
	def self.included(receiver)
		receiver.extend ClassMethods
	end
end