module Encoder
	# Object to be returned:
	# memmory: { exp: exp [, imed: imed]}
	def memmory_access(string)
		string.gsub!(/(\s|\[|\])/, '')
		obj = string.match(//)[0].gsub(/(\+|\-)/, '_#{string.match(/(\+|\-)/)[0]}_')
		obj
	end

	module_function :memmory_access
end
