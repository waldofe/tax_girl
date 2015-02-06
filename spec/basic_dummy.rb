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

  # Just to improve the spec initialization (it's not needed)
  def initialize(opts)
    self.provider_price              = opts[:provider_price]
    self.convenience_fee             = opts[:convenience_fee]
    self.commission_fee              = opts[:commission_fee]
    self.another_percentage_tax      = opts[:another_percentage_tax]
    self.coupon_discount             = opts[:coupon_discount]
    self.another_fix_discount        = opts[:another_fix_discount]
    self.black_friday_discount       = opts[:black_friday_discount]
    self.another_percentage_discount = opts[:another_percentage_discount]
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
