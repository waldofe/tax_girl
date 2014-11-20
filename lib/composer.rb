class Composer
  attr_accessor :demand_methods,
                :current_demand,
                :total

  def initialize(taxgirl_block)
    @demand_methods = { discount: { currency: [], percentage: [] }, increase: { currency: [], percentage: [] } }
    @current_demand = nil
    @taxgirl_block = taxgirl_block
    @total = 0
  end

  def evaluate!
    instance_eval(&@taxgirl_block)
  end

  def increase
    @current_demand = :increase

    yield
  end

  def discount
    @current_demand = :discount

    yield
  end

  def currency(*args)
    demand_methods[current_demand][:currency] = args
  end

  def percentage(*args)
    demand_methods[current_demand][:percentage] = args
  end
end
