require 'tax_girl'

class BasicDummy
  taxgirl :price do
    increase do
      currency   :provider_price, :convenience_fee
      percentage :commission_fee, :another_percentage_tax
    end

    discount do
      currency   :coupon_discount, :another_fix_discount
      percentage :black_friday_discount, :another_percentage_discount
    end
  end

  attr_accessor :provider_price,
                :convenience_fee,
                :commission_fee,
                :another_percentage_tax,
                :coupon_discount,
                :another_fix_discount,
                :black_friday_discount,
                :another_percentage_discount
end
