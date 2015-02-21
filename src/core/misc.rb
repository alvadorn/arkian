class Integer
  def to_unsigned
    self & 0xFFFF
  end
end
