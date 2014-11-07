require 'tax_girl'

class BasicDummy
  taxgirl :price do
    increase do
      currency 100, 200
      percentage 5
    end
  end
end