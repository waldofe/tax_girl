require 'tax_girl'

class BasicDummy
  taxgirl :value do
    increase do
      currency 100, 200
      percentage 5
    end
  end
end