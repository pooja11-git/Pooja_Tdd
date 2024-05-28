class StringCalculator
  def self.add(num_str)
    return 0 if num_str.empty?

    delimiter = ","
    custom_delimiter_match = num_str.match(/^\/\/(\[.*\]|\W)\n/)
    if custom_delimiter_match
      delimiter = parse_custom_delimiters(custom_delimiter_match[1])
      num_str = num_str.split("\n", 2)[1]
    end

    number_list = num_str.split(Regexp.union(delimiter)).map(&:to_i)
    
    negatives = number_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    number_list.sum
  end

  private

  def self.parse_custom_delimiters(delimiters)
    if delimiters.start_with?('[') && delimiters.end_with?(']')
      delimiters[1..-2].split('][')
    else
      [delimiters]
    end
  end
end
