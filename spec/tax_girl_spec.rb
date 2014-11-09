require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    context 'with BasicDummy' do
      let(:basic_dummy) { BasicDummy.new }

      context 'when increase' do
        it 'with success' do
          basic_dummy.first_fee = 10
          basic_dummy.second_fee = 20
          basic_dummy.first_percentage_fee = 5
          basic_dummy.second_percentage_fee = 2

          expect(basic_dummy.price).to eq 32.13
        end
      end
    end
  end
end