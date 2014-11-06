# define :value, after: :complete! do
#   apply do
#     cash 100, 10.5
#     percentage 0.1
#   end

#   discount do
#     cash 100
#     percentage 0.2
#   end
# end

require 'basic_dummy'
require 'tax_girl'

describe 'TaxGirl initial syntax' do
  describe '#taxgirl' do
    context 'when inscrease block' do
      it 'with success' do
        value = taxgirl :value do
          increase do
            currency 100, 200
            percentage 5
          end
        end
      end
    end

    context 'with BasicDummy' do
      let(:basic_dummy) { BasicDummy.new }

      context 'sets arg attribute with calculated value' do
        it 'with success' do
          expect(basic_dummy.currency).to eq 315
        end
      end
    end
  end

  # describe '#apply' do
  #   describe '#cash' do
  #     it 'when unique value' do
  #       taxgil :value, after: :complete! do
  #         apply do
  #           cash 100, 10.5
  #           percentage 0.1
  #         end

  #         discount do
  #           cash 100
  #           percentage 0.2
  #         end
  #       end

  #       expect(value).to eq 100
  #     end
  #   end
  # end
end