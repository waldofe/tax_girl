require 'initializer'
require 'increaser'
require 'pry'

def taxgirl(price_attr, params = {}, &increase_block)
  initializer = Initializer.new(increase_block)

  define_method :increase_tax do
    increaser = Increaser.new(initializer, self)
    increaser.amount
  end

  initializer.evaluate!
end
