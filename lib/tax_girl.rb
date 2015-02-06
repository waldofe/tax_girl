require 'tax_girl/composer'
require 'tax_girl/increaser'
require 'tax_girl/discounter'

module TaxGirl
  def taxgirl(price_attr, &main_block)
    composer = Composer.new(main_block)

    define_method price_attr do
      Increaser.new(composer, self)
      Discounter.new(composer, self)

      composer.total
    end

    composer.evaluate!
  end
end