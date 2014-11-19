class Increaser
  attr_accessor :subject, :scope

  def initialize(subject, scope)
    @subject = subject
    @scope   = scope
  end

  def calculate
    calculate_currency
    calculate_percentage
  end

  def calculate_currency
    subject.total = subject.currency_demand.map do |method|
      scope.send(method)
    end.reduce(:+)
  end

  def calculate_percentage
    subject.percentage_demand.each do |method|
      value = scope.send(method)
      subject.total += (value.to_f / 100) * subject.total
    end
  end
end
