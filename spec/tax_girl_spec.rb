require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    context 'using BasicDummy' do
      let(:dummy) { BasicDummy.new }

      context 'when only increase methods exists' do
        before(:each) do
          dummy.provider_price = 10
          dummy.convenience_fee = 20
          dummy.commission_fee = 5
          dummy.another_percentage_tax = 2
        end

        it 'provides increase tax amount' do
          expect(dummy.increase_tax).to eq 32.13
        end
      end
    end
  end
end
