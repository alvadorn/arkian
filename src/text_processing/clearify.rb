module TextProcessing
  def clearify(text)
    text.split(/\n/).map do |t|
      t.split(/[\s,]/).delete_if { |i| i == "" }
    end
  end

  module_function :clearify
end
