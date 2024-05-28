require 'rails_helper'

RSpec.describe StringCalculator do
  describe 'string of comma-separated numbers' do
    it 'it will return 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

     it 'it will return the number for a single number string' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'it will return the sum of two comma-separated numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end
  end
end
