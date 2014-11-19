require 'initializer'
require 'increaser'
require 'pry'

def taxgirl(price_attr, params = {}, &increase_block)
  initializer = Initializer.new(price_attr, params, increase_block)

  define_method price_attr do
    Increaser.new(initializer, self).calculate

    initializer.total
  end

  initializer.evaluate!
end
