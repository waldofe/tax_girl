require 'initializer'
require 'pry'

def taxgirl(price_attr, params = {}, &increase_block)
  subject = Initializer.new(price_attr, params, increase_block)

  define_method price_attr do
    Increaser.new(subject, self).calculate

    subject.total
  end

  subject.evaluate!
end