require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    context 'with BasicDummy' do
      let(:basic_dummy) { BasicDummy.new }

      context 'with success' do
        it 'when all increase and decrease methods exists' do
          # fixed increase
          basic_dummy.provider_price = 10
          basic_dummy.convenience_fee = 20

          # percentage increase
          basic_dummy.commission_fee = 5
          basic_dummy.another_percentage_discount = 2

          expect(basic_dummy.price).to eq 32.13

          # # fixed discount
          # basic_dummy.coupon_discount = 5
          # basic_dummy.another_fix_discount = 5

          # # percentage discount
          # basic_dummy.black_friday_discount = 2
          # basic_dummy.another_percentage_discount = 10

          # expect(basic_dummy.price).to eq
        end
      end
    end
  end
end