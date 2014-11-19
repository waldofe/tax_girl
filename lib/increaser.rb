class Increaser
  attr_accessor :initializer, :scope

  def initialize(initializer, scope)
    @initializer = initializer
    @scope       = scope
  end

  def calculate
    calculate_currency
    calculate_percentage
  end

  def calculate_currency
    initializer.total = initializer.currency_demand.map do |method|
      scope.send(method) || 0
    end.reduce(:+)
  end

  def calculate_percentage
    initializer.percentage_demand.each do |method|
      value = scope.send(method)
      initializer.total += (value.to_f / 100) * initializer.total
    end
  end
end
