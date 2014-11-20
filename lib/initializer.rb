class Initializer
  attr_accessor :currency_demand,
                :percentage_demand,
                :currency_values,
                :total

  def initialize(increase_block)
    @increase_block = increase_block
    @currency_values = []
    @currency_demand = []
    @percentage_demand = []
    @total = 0
  end

  # Brings all taxgirl block into TaxGirl class
  def evaluate!
    instance_eval(&@increase_block)
  end

  def increase
    yield
  end

  def discount
    yield
  end

  # catalogs currency methods
  def currency(*args)
    @currency_demand += args
  end

  # catalogs percentage methods
  def percentage(*args)
    @percentage_demand += args
  end
end
