require_relative '../../src/text_processing/clearify'

describe 'TextProcessing::clearify', '#clearify' do

  context 'using random text' do

      it 'and trying to clearify' do
          text = "I\'m sexy  and I know it\t.
          And everything I do\nis revered.\n"

          result = TextProcessing.clearify(text)
          expected = [["I\'m","sexy","and","I","know","it","."],["And",
            "everything", "I", "do"], ["is","revered."]]

          expect(result).to eq(expected)
      end

  end

  context 'using some mnemonic expressions' do

    it 'it would return separated' do
      mnemonics = "add ax, 25
                   call 500
                   mov ax, cx
                   inc cx
                   ret"
      expected = [["add","ax", "25"], ["call", "500"], ["mov", "ax", "cx"],
        ["inc", "cx"], ["ret"]]

      result = TextProcessing.clearify(mnemonics)
      expect(result).to eq(expected)

    end

  end

end
