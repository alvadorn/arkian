require 'encode'

module TextProcessing
	# the data should be returned as { line: number_line, code: { instruction: inst, arg1: :arg1 [, arg2: :arg2,
	# [, memmory: { exp: exp, [, imed: imed] } ], imed: imed], label: name } } 
	def clearify(text)
		processed_text = []
		text.split(/\n/).each_with_index do |t, index|
			line = { line: index }
			t.split(/\,/).each_with_index do |split|
				Encode.memmory_access(split) if split.include? "["
			end
		#text.split(/\n/).map do |t|
    #  t.split(/[\s,]/).delete_if { |i| i == "" }
    #end
			processed_text << line
		end
		processed_text
	end

	def memmory_fix(text)

	end


  module_function :clearify
end
