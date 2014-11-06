def taxgirl(price_attr, params = {}, &apply_block)
  TaxGirl.new(price_attr, params, apply_block).evaluate!
end

class TaxGirl
  def initialize(price_attr, params, apply_block)
    @method = params.fetch(:after, nil)
    @apply_block = apply_block
    @total = 0
  end

  def evaluate!
    instance_eval(&@apply_block)
  end

  def increase(&block)
    Increaser.new(@total, block).evaluate!
  end
end

class Increaser
  def initialize(total, increase_block)
    @total = total
    @increase_block = increase_block
  end

  def evaluate!
    instance_eval(&@increase_block)
  end

  def currency(*args)
    @total += args.reduce(:+)
  end

  def percentage(*args)
    args.each do |percentage_value|
      @total += (percentage_value.to_f / 100) * @total
    end

    @total
  end
end
