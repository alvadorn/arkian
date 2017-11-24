module Encoder
	
	# Object to be returned:
	# { memory: { exp: exp [, imed: imed] } }
	def memory_access(string)
		# string.gsub!(/(\s|\[|\])/, '')
		values = string.upcase.scan(/([B,S][P,I,X])?(\-?\d*)/).flatten.delete_if { |v| v == "" || v == nil }

		raise "ERROR: Bad format in line" if values.empty?

		result = {}
		
		case values.length
		when 1
			result[:memory] = one_arg(values)
		when 2 
			result[:memory] = two_args(values)
		end
		result
	end
	
	private 

	def is_number?(args)
		!args[0].scan(/\d+/).empty?
	end

	def two_args(args)
		if is_number? args[1]
			{ exp: [args[0]], imed: args[1].to_i }
		else
			{ exp: args }
		end
	end

	def one_arg(args)
		if is_number? args
			{ imed: args[0].to_i }
		else
			{ exp: args }
		end
	end


#	module_function :one_arg, :is_number?
end
