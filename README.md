tax_girl
=======

#### Under construction..


## Goal

Build a currency calculation arbitrator with a simple Ruby DSL syntax

### Actual sketch

```ruby
class Product
  taxgirl :price, after: :approve! do
    increase do
      currency   :provider_price, :convenience_fee
      percentage :commission_fee
    end

    discount do
      currency   :coupon_discount
      percentage :black_friday_discount
    end
  end

  def approve!
    # TaxGirl calculation trigger
  end

  def provider_price
    # providers price logic..
  end

  def convenience_fee
    # convenicence fee logic..
  end

  def commission_fee
    # commision fee logic..
  end

  def coupon_discount
    # coupon discount logic..
  end

  def black_friday_discount
    # black friday discount logic..
  end
end
```
