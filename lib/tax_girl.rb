require 'pry'

def taxgirl(price_attr, params = {}, &increase_block)
  subject = TaxGirl.new(price_attr, params, increase_block)

  define_method price_attr do
    # calculating currency methods
    subject.total = subject.currency_demand.map do |method|
      self.send(method)
    end.reduce(:+)

    # calculating percentage methods
    subject.percentage_demand.each do |method|
      value = self.send(method)
      subject.total += (value.to_f / 100) * subject.total
    end

    subject.total
  end

  subject.evaluate!
end

class TaxGirl
  attr_accessor :currency_demand,
                :percentage_demand,
                :currency_values,
                :total

  def initialize(price_attr, params, increase_block)
    @method = params.fetch(:after, nil)
    @increase_block = increase_block
    @total = 0
    @currency_values = []
  end

  # Brings all taxgirl block into TaxGirl class
  def evaluate!
    instance_eval(&@increase_block)
  end

  def increase
    yield
  end

  # catalogs currency methods
  def currency(*args)
    @currency_demand = args
  end

  # catalogs percentage methods
  def percentage(*args)
    @percentage_demand = args
  end
end

