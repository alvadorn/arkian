module Encoder
	# Object to be returned:
	# memory: { exp: exp [, imed: imed]}
	def memory_access(string)
		string.gsub!(/(\s|\[|\])/, '')
		obj = string.match(//)[0].gsub(/(\+|\-)/, '_#{string.match(/(\+|\-)/)[0]}_')
		obj
	end

	module_function :memory_access
end
