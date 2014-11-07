require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    context 'with BasicDummy' do
      let(:basic_dummy) { BasicDummy.new }

      context 'sets arg attribute with calculated value' do
        it 'with success' do
          expect(basic_dummy.price).to eq 315
        end
      end
    end
  end
end