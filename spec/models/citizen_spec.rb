RSpec.describe Citizen, type: :model do
  describe 'validations' do
    describe '#email' do
      context 'when is not valid' do
        it 'raises a record invalid error' do
          expect { create(:citizen, email: 'invalid email') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, email: 'invalid@email') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, email: 'invalid@email.') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, email: 'inv.alid@email') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, email: '@email.com') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, email: '@.') }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when is valid' do
        it 'not raises a record invalid error' do
          expect { create(:citizen, email: 'email@provider.com') }.to_not raise_error
        end
      end
    end

    describe '#cpf' do
      context 'when cpf is not valid' do
        it 'raises a record invalid error' do
          expect { create(:citizen, cpf: '00000000001') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, cpf: '000.000.000-00') }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when cpf is valid' do
        it 'not raises a record invalid error' do
          expect { create(:citizen, cpf: '00000000191') }.to_not raise_error
          expect { create(:citizen, cpf: '000.000.001-91') }.to_not raise_error
          expect { create(:citizen, cpf: '00000000272') }.to_not raise_error
          expect { create(:citizen, cpf: '000.000.002-72') }.to_not raise_error
        end
      end
    end

    describe '#cns' do
      context 'when cns is not valid' do
        it 'raises a record invalid error' do
          expect { create(:citizen, cns: '00000000001') }.to raise_error(ActiveRecord::RecordInvalid)
          expect { create(:citizen, cns: '000000000000001') }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when cns is valid' do
        it 'not raises a record invalid error' do
          expect { create(:citizen, cns: '153161846120000') }.to_not raise_error
          expect { create(:citizen, cns: '163487837150008') }.to_not raise_error
          expect { create(:citizen, cns: '765993257600004') }.to_not raise_error
          expect { create(:citizen, cns: '208946256600002') }.to_not raise_error
        end
      end
    end
  end
end
