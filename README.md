tax_girl
=======

### Introduction

TaxGirl is a simple tool that help's keeping calculation logic explicit using a pretty
ruby DSL. It also avoids the hard work of seaching for layers and layers of calculation methods.

### Composing price

#### Increase block

Block where you define which methods will be triggered to compose the main price amount.

#### Params

**currency** and **percentage** - Accepts a method or list of methods symbols that will be triggered
on the moment you call the method passed as param to taxgirl (*price* on the example below).

Obs: *percentage* methods amounts will be applied on typed order.

```ruby
class Product
  taxgirl :price do
    increase do
      currency   :provider_price, :convenience_fee
      percentage :commission_fee, :another_fee
    end

    def provider_price
      105.5
    end

    def convenience_fee
      5.0
    end

    def commission_fee
      // It means 10% to tax girl
      10.0
    end

    def another_fee
      // It means 5.5% to tax girl
      5.5
    end
  end
end

product = Product.new
product.price

=> 128.23525

```

Obs: *price* will be calculated every time it's called.

#### Discount block

Block where you define which methods will be triggered to discount the main price amount calculated on *increase block*.

```ruby
class Product
  taxgirl :price do
    increase do
      currency   :provider_price, :convenience_fee
      percentage :commission_fee, :another_fee
    end

    discount do
      currency   :special_coupon_discount
      percentage :black_friday_discount
    end

    def provider_price
      105.5
    end

    def convenience_fee
      5.0
    end

    def commission_fee
      // It means 10% to tax girl
      10.0
    end

    def another_fee
      // It means 5.5% to tax girl
      5.5
    end

    def special_coupon_discount
      20.0
    end

    def black_friday_discount
      // It means 15% to tax girl
      15.0
    end
  end
end

product = Product.new
product.price

=> 91.99996250000001
```

### Contributing

- Create an issue
- Fork the project
- Send a pull request
- Have fun! :)
