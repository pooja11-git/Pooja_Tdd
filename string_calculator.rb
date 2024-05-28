class StringCalculator
  def self.add(num_str)
    return 0 if num_str.empty?
    num_str.split(',').map(&:to_i).sum
  end
end