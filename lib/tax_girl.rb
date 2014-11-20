require 'composer'
require 'increaser'
require 'discounter'
require 'pry'

def taxgirl(price_attr, &increase_block)
  composer = Composer.new(increase_block)

  define_method price_attr do
    Increaser.new(composer, self)
    Discounter.new(composer, self)

    composer.total
  end

  composer.evaluate!
end
