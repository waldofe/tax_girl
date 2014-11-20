require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    context 'using BasicDummy' do
      context 'when all increase methods responds with a number' do
        let(:dummy) { BasicDummy.new }

        before(:each) do
          dummy.provider_price = 10
          dummy.convenience_fee = 20
          dummy.commission_fee = 5
          dummy.another_percentage_tax = 2
        end

        it 'main taxgirl attribute returns increased tax' do
          expect(dummy.price).to eq 32.13
        end

        it 'multiple calls does not affect calculation' do
          dummy.price

          expect(dummy.price).to eq 32.13
        end
      end

      context 'when all discount methods responds with a number' do
        let(:dummy) { BasicDummy.new }

        before(:each) do
          # Increase values
          dummy.provider_price = 100
          dummy.convenience_fee = 0
          dummy.commission_fee = 0
          dummy.another_percentage_tax = 0

          # Discount values
          dummy.coupon_discount = 10
          dummy.another_fix_discount = 20
          dummy.black_friday_discount = 50
          dummy.another_percentage_discount = 1
        end

        it 'main taxgirl attribute returns discounted tax' do
          expect(dummy.price).to eq 34.65
        end

        it 'multiple calls does not affect calculation' do
          dummy.price

          expect(dummy.price).to eq 34.65
        end
      end
    end
  end
end