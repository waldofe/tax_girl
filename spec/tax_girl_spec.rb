require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    let!(:simple_dummy) {
      BasicDummy.new provider_price:         10,
                     convenience_fee:        20,
                     commission_fee:         5,
                     another_percentage_tax: 2
    }

    let!(:complete_dummy) {
      BasicDummy.new provider_price:              100,
                     convenience_fee:             0,
                     commission_fee:              0,
                     another_percentage_tax:      0,
                     coupon_discount:             10,
                     another_fix_discount:        20,
                     black_friday_discount:       50,
                     another_percentage_discount: 1
    }

    context 'when only increase methods (simple_dummy)' do
      it 'main taxgirl attribute returns calculated tax' do
        expect(simple_dummy.price).to eq 32.13
      end

      it 'multiple calls does not affect calculation result' do
        simple_dummy.price
        expect(simple_dummy.price).to eq 32.13
      end

      it 'changes on the fly are considered on calculation result' do
        simple_dummy.provider_price = 100
        expect(simple_dummy.price).to eq 128.52
      end
    end

    context 'when increase and discount methods (complete_dummy)' do
      it 'main taxgirl attribute returns calculated tax' do
        expect(complete_dummy.price).to eq 34.65

        complete_dummy.provider_price = 90
      end

      it 'multiple calls does not affect calculation result' do
        complete_dummy.price
        expect(complete_dummy.price).to eq 34.65
      end

      it 'changes on the fly are considered on calculation result' do
        complete_dummy.provider_price = 90
        expect(complete_dummy.price).to eq 29.7
      end
    end

    context 'when no value from a currency method' do
      it '0 is returned from it' do
        simple_dummy.provider_price = nil
        expect(simple_dummy.price).to eq 21.42
      end
    end

    context 'when no value from a percentage method' do
      it '0 is returned from it' do
        simple_dummy.commission_fee = nil
        expect(simple_dummy.price).to eq 30.6
      end
    end
  end
end