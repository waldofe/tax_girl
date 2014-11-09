require 'tax_girl'

class BasicDummy
  taxgirl :price do
    increase do
      currency   :first_fee, :second_fee
      percentage :first_percentage_fee, :second_percentage_fee
    end
  end

  attr_accessor :first_fee,
                :second_fee,
                :first_percentage_fee,
                :second_percentage_fee
end