def taxgirl(price_attr, params = {}, &increase_block)
  subject = TaxGirl.new(price_attr, params, increase_block)

  define_method price_attr do
    subject.total
  end

  subject.evaluate!
end

class TaxGirl
  attr_reader :total

  def initialize(price_attr, params, increase_block)
    @method = params.fetch(:after, nil)
    @increase_block = increase_block
    @total = 0
  end

  # Brings all taxgirl block into TaxGirl class
  def evaluate!
    instance_eval(&@increase_block)
  end

  def increase
    yield
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

