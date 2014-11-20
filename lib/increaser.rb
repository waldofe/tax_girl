class Increaser
  attr_accessor :initializer, :scope, :amount

  def initialize(initializer, scope)
    @initializer = initializer
    @scope       = scope
    @amount      = 0

    calculate_amount
  end

  def calculate_amount
    calculate_currency
    calculate_percentage
  end

  def calculate_currency
    self.amount += initializer.currency_demand.map do |method|
      scope.send(method) || 0
    end.reduce(:+)
  end

  def calculate_percentage
    initializer.percentage_demand.each do |method|
      value = scope.send(method)
      self.amount += (value.to_f / 100) * amount
    end
  end
end
