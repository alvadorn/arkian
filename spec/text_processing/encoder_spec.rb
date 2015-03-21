require_relative '../../src/text_processing/encoder'

describe 'Encoder' do
	context 'memory arg should return a hash' do
		it 'from bx+si+9' do
			string = '[bx+si+9]'
			expected = { memory: { exp: :bx_si, imed: 9 } }
			result = Encoder.memory_access(string)

			expect(result).to eq(expected)
		end
	end
end

